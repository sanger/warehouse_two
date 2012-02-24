class ActiveRecord::Base
  # After saving the record ensure that the UUID information is kept up-to-date
  after_save(:maintain_uuid_object, :if => :has_uuid?)
  def has_uuid?
    respond_to?(:uuid) 
  end

  def maintain_uuid_object
    return if self.uuid.nil? # Link table rows can have no UUID!

    name        = self.name        if self.respond_to?(:name)
    internal_id = self.internal_id if self.respond_to?(:internal_id)

    uuid_object = ::UuidObject.find_by_uuid(self.uuid)
    if uuid_object.present?
      uuid_object.update_attributes!(
        :name         => name,
        :last_updated => self.last_updated,
        :checked_at   => Time.now
      )
    else
      UuidObject.create!(
        :uuid         => self.uuid,
        :object_name  => self.class.name.pluralize.underscore,
        :internal_id  => internal_id,
        :name         => name,
        :created      => self.created,
        :last_updated => self.last_updated,
        :checked_at   => Time.now
      )
    end
  end
  private :maintain_uuid_object
end

# Cause the UuidObject instance to not think it has a UUID!
UuidObject
class UuidObject
  def has_uuid?
    false
  end
end

require 'amqp'
Rails.logger.info("AMQP Consumer: Starting AMQP consumer ...")
puts("AMQP Consumer: Starting AMQP consumer ...")
AMQP.start(configatron.amqp_url) do |client, opened_ok|
  show_stopper = Proc.new { client.close { EventMachine.stop } }
  Signal.trap("TERM", show_stopper)

  channel = AMQP::Channel.new(client)
  channel.topic('psd.sequencescape', :passive => true) do |exchange, declared_ok|
    channel.queue('psd.warehouse_two', :passive => true) do |queue, queue_declared|
      Rails.logger.info("AMQP Consumer: Waiting for messages ...")
      puts("AMQP Consumer: Waiting for messages ...")
      queue.subscribe do |metadata, payload|
        Rails.logger.debug("AMQP Consumer: Message received from queue: #{payload.inspect}")

        json = ActiveSupport::JSON.decode(payload)
        db_model, api_model = json.keys.first.classify.constantize, "api/#{json.keys.first}".classify.constantize
        ActiveRecord::Base.transaction do
          db_model.create_or_update(api_model.new(json)).tap do |record|
            Rails.logger.debug("AMQP Consumer: Created #{record.class.name}(#{record.id})")
          end
        end
      end
    end
  end
end
