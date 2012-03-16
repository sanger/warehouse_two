require 'amqp'

class AmqpConsumer
  def run
    Rails.logger.info("AMQP Consumer: Starting AMQP consumer ...")
    puts("AMQP Consumer: Starting AMQP consumer ...")
    AMQP.start(WarehouseTwo::Application.config.amqp.url) do |client, opened_ok|
      show_stopper = Proc.new { client.close { EventMachine.stop } }
      Signal.trap("TERM", show_stopper)

      channel = AMQP::Channel.new(client)
      channel.prefetch(WarehouseTwo::Application.config.amqp.prefetch)
      channel.queue('psd.warehouse_two', :passive => true) do |queue, queue_declared|
        Rails.logger.info("AMQP Consumer: Waiting for messages ...")
        puts("AMQP Consumer: Waiting for messages ...")
        queue.subscribe(:ack => true) do |metadata, payload|
          begin
            Rails.logger.debug("AMQP Consumer: Message received from queue: #{payload.inspect}")

            json         = ActiveSupport::JSON.decode(payload)
            payload_name = json.keys.first
            begin
              ActiveRecord::Base.transaction do
                payload_name.classify.constantize.create_or_update_from_json(json[payload_name]).tap do |record|
                  metadata.ack  # Acknowledge receipt!
                  Rails.logger.debug("AMQP Consumer: Created #{record.class.name}(#{record.id})")
                end
              end
            rescue => exception
              channel.reject(metadata.delivery_tag, true)   # Requeue the message later
              raise
            end
          rescue NameError => exception
            Rails.logger.debug("AMQP Consumer (#{metadata.delivery_tag.inspect}): #{exception.message}")
          rescue => exception
            Rails.logger.error("AMQP Consumer (#{metadata.delivery_tag.inspect}): #{exception.message}")
            Rails.logger.debug("AMQP Consumer (#{metadata.delivery_tag.inspect}): #{payload}")
          end
        end
      end
    end
  end
end
