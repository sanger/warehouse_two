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

      # On creation, ensure that this is the only record that is current.  If the record has been
      # deleted then we need to not set this to current.
      before_create { |record| record.is_current = !record.deleted? ; true }

      after_create do |record|
        record.class.for_uuid(record.uuid).current.not_record(record).update_all('is_current=FALSE')
      end

      delegate :correct_current_time, :to => 'self.class'
    end
  end

  # Has this record been deleted remotely
  def deleted?
    deleted_at.present?
  end

  IGNOREABLE_ATTRIBUTES = [ 'dont_use_id', 'id', 'is_current', 'inserted_at', 'checked_at' ]

  def updated_values?(object)
    us, them = self.attributes.stringify_keys, object.attributes.stringify_keys.reverse_slice(IGNOREABLE_ATTRIBUTES)
    not us.within_acceptable_bounds?(them)
  end

  def checked!
    self.save!
    self
  end

  def check(object)
    updated_values?(object) ? yield : checked!
  end

  module ClassMethods
    def correct_current_time
      self.default_timezone == :utc ? Time.now.utc : Time.now
    end

    def link_resources(_)
      # Empty by default
    end

    def create_or_update(resource_object)
      new_object = new(parse_resource_object(resource_object))
      local_object = current.for_uuid(new_object.uuid).first
      local_object.check(new_object) { new_object.save! ; new_object }
    end

    # Fields that come from the JSON across all models.
    STANDARD_FIELDS = {
      :uuid         => :uuid,
      :last_updated => :updated_at,
      :created      => :created_at,
      :deleted_at   => :deleted_at
    }

    def parse_resource_object(resource_object)
      resource = resource_object.try(:send, self.model_name.underscore) or return {}
      helper   = lambda do |(internal_name, external_name)|
        value = Array(external_name).inject(resource) { |o,m| o.respond_to?(m) ? o.send(m) : nil }
        [internal_name, value]
      end

      Hash[
        map_internal_to_external_attributes.map(&helper) +
        STANDARD_FIELDS.map(&helper)
      ].tap do
        link_resources(resource_object)
      end
    end
    private :parse_resource_object
  end

  module CoreExtensions
    module Hash
      # Determines if this hash is within an acceptable bounds of the keys common with the
      # given hash.  It is assumed that values missing from 'other' are unchanged.
      def within_acceptable_bounds?(other)
        (self.keys & other.keys).all? do |key|
          self[key].within_acceptable_bounds?(other[key])
        end
      end

      # Does the opposite of slice, returning a hash that does not have the specified keys!
      def reverse_slice(*keys)
        keys.flatten!
        dup.delete_if { |k,_| keys.include?(k) }
      end
    end

    module Object
      def within_acceptable_bounds?(value)
        self == value
      end
    end

    module String
      def within_acceptable_bounds?(value)
        self == value.to_s
      end
    end

    module Numeric
      def within_acceptable_bounds?(v)
        (self - v).abs < configatron.numeric_tolerance
      end
    end

    module NilClass
      def check(_)
        yield
      end
    end
  end
end

# Extend the core classes with the behaviour we need
class Hash     ; include ResourceTools::CoreExtensions::Hash     ; end
class Object   ; include ResourceTools::CoreExtensions::Object   ; end
class String   ; include ResourceTools::CoreExtensions::String   ; end
class Numeric  ; include ResourceTools::CoreExtensions::Numeric  ; end
class NilClass ; include ResourceTools::CoreExtensions::NilClass ; end
