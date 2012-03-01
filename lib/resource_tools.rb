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
      named_scope :not_record, lambda { |record| { :conditions => [ 'dont_use_id != ?', record.dont_use_id ] } }

      # Ensure that the time stamps are correct whenever a record is updated
      before_create { |record| record.inserted_at = record.correct_current_time }
      before_save   { |record| record.checked_at  = record.correct_current_time }

      # On creation, ensure that this is the only record that is current.
      before_create do |record|
        record.is_current = true
      end

      after_create do |record|
        record.class.for_uuid(record.uuid).current.not_record(record).update_all('is_current=FALSE')
      end

      delegate :correct_current_time, :to => 'self.class'
    end
  end

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
