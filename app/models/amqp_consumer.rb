require 'amqp'

class AmqpConsumer
  delegate :url, :queue, :prefetch, :requeue, :reconnect_interval, :to => :'WarehouseTwo::Application.config.amqp'
  alias_method(:requeue?, :requeue)

  def run
    info { "Starting AMQP consumer ..." }

    AMQP.start(url) do |client, opened_ok|
      install_show_stopper_into(client)
      setup_error_handling(client)
      build_client(client)
    end
  end

  def received(metadata, payload)
    json         = ActiveSupport::JSON.decode(payload)
    payload_name = json.keys.first
    ActiveRecord::Base.transaction do
      payload_name.classify.constantize.create_or_update_from_json(json[payload_name]).tap do |record|
        metadata.ack  # Acknowledge receipt!
        debug { "Created #{record.class.name}(#{record.id})" }
      end
    end
  end
  private :received

  def setup_error_handling(client)
    client.on_error do |connection, connection_close|
      if connection_close.reply_code == 320
        info { "Connection has been disconnected, retrying at #{reconnect_interval}s" }
        connection.periodically_reconnect(reconnect_interval)
      else
        error { "Connection error #{connection_close.reply_code}: #{connection_close.reply_text}" }
        EventMachine.stop  # Brutally stop the consumer!
      end
    end

    client.on_recovery do |*args|
      info { "Connection has recovered, rebuilding system ..." }
      build_client(client)
    end
  end
  private :setup_error_handling

  def build_client(client)
    info { "Connecting to queue #{queue.inspect} ..." }

    channel = AMQP::Channel.new(client)
    channel.prefetch(prefetch)
    channel.queue(queue, :passive => true) do |queue, queue_declared|
      info { "Waiting for messages ..." }

      queue.subscribe(:ack => true) do |metadata, payload|
        begin
          debug { "Message received from queue: #{payload.inspect}" }
          begin
            received(metadata, payload)
          rescue => exception
            # The system is setup to deadletter rejected messages, so simply reject it here with no re-queueing
            channel.reject(metadata.delivery_tag, requeue?)
            raise
          end
        rescue NameError, StandardError => exception
          debug { "AMQP Consumer (#{metadata.delivery_tag.inspect}): #{exception.message}" }
          debug { "AMQP Consumer (#{metadata.delivery_tag.inspect}): #{payload}" }
        end
      end
    end
  end
  private :build_client

  # Deals with the signals that should stop the show!
  def install_show_stopper_into(client)
    ['TERM', 'INT'].each do |signal|
      Signal.trap(signal, Proc.new do
        info { "Received #{signal} signal, so quitting ..." }
        client.close { EventMachine.stop }
      end)
    end
  end
  private :install_show_stopper_into

  [ :debug, :info, :error ].each do |level|
    line = __LINE__ + 1
    class_eval(%Q{
      def #{level}(&message)
        Rails.logger.#{level} {
          "\#{self.class.name}: \#{message.call}".tap { |m| puts m }
        }
      end
    }, __FILE__, line)
  end
end
