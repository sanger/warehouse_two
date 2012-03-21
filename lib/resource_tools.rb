module ResourceTools
  require 'resource_tools/core_extensions'

  extend ActiveSupport::Concern
  include Uuidable
  include ResourceTools::SequenceOfDates
  include ResourceTools::Json
  include ResourceTools::Timestamps

  included do
    self.primary_key = :dont_use_id

    # The original data information is stored here
    attr_accessor :data

    # A few useful named scopes
    scope :not_record, lambda { |record| where('dont_use_id != ?', record.dont_use_id) }

    # Maintain the flow of current_from and current_to.
    sequence_of_dates_over(:current_from, :current_to)
  end

  def related
    self.class.for_uuid(self.uuid)
  end

  # Has this record been deleted remotely
  def deleted?
    deleted_at.present?
  end

  IGNOREABLE_ATTRIBUTES = [ 'dont_use_id', 'is_current', 'inserted_at', 'checked_at', 'current_from', 'current_to' ]

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
    def create_or_update(attributes)
      new_object   = new(attributes.reverse_merge(:data => attributes))
      local_object = current.for_uuid(new_object.uuid).first
      local_object.check(new_object) { new_object.save! ; new_object }
    end
    private :create_or_update
  end
end
