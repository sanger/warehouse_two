class Event < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid               => :uuid,
      :internal_id        => :internal_id,
      :source_internal_id => :eventful_internal_id,
      :source_uuid        => :eventful_uuid,
      :source_type        => :eventful_type,
      :message            => :message,
      :state              => :family,
      :identifier         => :identifier,
      :location           => :location,
      :actioned           => :actioned,
      :content            => :content,
      :created_by         => :created_by,
      :of_interest_to     => :of_interest_to,
      :descriptor_key     => :descriptor_key,
      :last_updated       => :updated_at,
      :created            => :created_at
    }
  end

end