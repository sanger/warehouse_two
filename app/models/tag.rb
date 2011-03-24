class Tag < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                       => :uuid,
      :internal_id                => :internal_id,
      :expected_sequence          => :expected_sequence,
      :map_id                     => :map_id,
      :tag_group_name             => :tag_group_name,
      :tag_group_uuid             => :tag_group_uuid,
      :tag_group_internal_id      => :tag_group_internal_id,
      :last_updated               => :updated_at,
      :created                    => :created_at
    }
  end

end