class Tag < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id                => :internal_id,
      :expected_sequence          => :expected_sequence,
      :map_id                     => :map_id,
      :tag_group_name             => :tag_group_name,
      :tag_group_uuid             => :tag_group_uuid,
      :tag_group_internal_id      => :tag_group_internal_id
    }
  end

end
