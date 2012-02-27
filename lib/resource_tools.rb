class Hash
  # Determines if this hash is within an acceptable bounds of the keys common with the
  # given hash.  It is assumed that values missing from 'other' are unchanged.
  def within_acceptable_bounds?(other)
    (self.keys & other.keys).all? do |key|
      self[key].within_acceptable_bounds?(other[key])
    end
  end

  # Does the opposite of slice, returning a hash that does not have the specified keys!
  def reverse_slice(*keys)
    dup.delete_if { |k,_| keys.include?(k) }
  end
end

class Object
  alias_method(:within_acceptable_bounds?, :==)
end

class Numeric
  def within_acceptable_bounds?(v)
    (self - v).abs < configatron.numeric_tolerance
  end
end

class NilClass
  def check(_)
    yield
  end
end

module ResourceTools
  def self.included(base)
    base.class_eval do
      extend ClassMethods
      set_primary_key :dont_use_id
      alias_attribute :id, :dont_use_id

      named_scope :for_uuid, lambda { |uuid| { :conditions => { :uuid => uuid } } }
      named_scope :current, { :conditions => { :is_current => true } }

      # Ensure that the time stamps are correct whenever a record is updated
      before_create { |record| record.inserted_at = record.correct_current_time }
      before_save   { |record| record.checked_at  = record.correct_current_time }

      # On creation, ensure that this is the only record that is current.
      before_create do |record|
        record.is_current = true
        record.class.for_uuid(record.uuid).current.update_all('is_current=FALSE')
      end

      # After saving the UUID details need maintaining.
      after_create(:create_uuid_object)
      after_update(:update_uuid_object)

      delegate :correct_current_time, :to => 'self.class'
    end
  end

  def to_attributes_for_uuid_object
    {
      :last_updated => self.last_updated,
      :checked_at   => self.checked_at,
      :object_name  => self.class.name.pluralize.underscore
    }.tap do |attributes|
      attributes[:name]        = self.name        if respond_to?(:name)
      attributes[:internal_id] = self.internal_id if respond_to?(:internal_id)
    end
  end

  # Create, or update the existing, UuidObject instance associated with this resource.  This
  # means that a UUID could change the resource it is referencing.
  def create_uuid_object
    object = UuidObject.find_by_uuid(self.uuid) || UuidObject.method(:create!)
    object.call(self.to_attributes_for_uuid_object.merge(
      :uuid    => self.uuid,
      :created => self.created
    ))
  end
  private :create_uuid_object

  # Update the existing UuidObject instance associated with this resource.  It must exist,
  # otherwise we have inconsistencies in the data.
  def update_uuid_object
    ::UuidObject.find_by_uuid(self.uuid).update_attributes!(self.to_attributes_for_uuid_object)
  end
  private :update_uuid_object

  def updated_values?(remote_values)
    values = remote_values.symbolize_keys.reverse_slice(:last_updated, :created, :entry_date)
    self.attributes.symbolize_keys.within_acceptable_bounds?(values)
  end

  def checked!
    self.save!
    self
  end

  def check(values)
    updated_values?(values) ? yield : checked!
  end

  module ClassMethods
    def correct_current_time
      self.default_timezone == :utc ? Time.now.utc : Time.now
    end

    def link_resources(_)
      # Empty by default
    end

    def create_or_update(resource_object)
      remote_values = parse_resource_object(resource_object)
      local_object = current.for_uuid(remote_values[:uuid]).first
      local_object.check(remote_values) { create!(remote_values) }
    end

    def parse_resource_object(resource_object)
      resource = resource_object.try(:send, self.model_name.underscore) or return {}

      translated_resource = Hash[
        map_internal_to_external_attributes.map do |internal_name, external_name|
          value = Array(external_name).inject(resource) { |o,m| o.respond_to?(m) ? o.send(m) : nil }
          [internal_name, value]
        end
      ]

      link_resources(resource_object)
      translated_resource
    end
    private :parse_resource_object
  end
end
