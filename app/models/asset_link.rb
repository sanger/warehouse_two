class AssetLink < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid            => :uuid, 
      :ancestor_uuid   => :ancestor_uuid, 
      :ancestor_internal_id     => :ancestor_internal_id, 
      :ancestor_type   => :ancestor_type,
      :descendant_uuid => :descendant_uuid,
      :descendant_internal_id   => :descendant_internal_id,
      :descendant_type => :descendant_type,
      :last_updated    => :updated_at,
      :created         => :created_at
    }
  end
  
end