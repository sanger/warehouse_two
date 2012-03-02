class AssetLink < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :ancestor_uuid          => :ancestor_uuid,
      :ancestor_internal_id   => :ancestor_internal_id,
      :ancestor_type          => :ancestor_type,
      :descendant_uuid        => :descendant_uuid,
      :descendant_internal_id => :descendant_internal_id,
      :descendant_type        => :descendant_type
    }
  end

end
