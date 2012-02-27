class TagInstance < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :internal_id,
      :name                    => :name,
      :barcode                 => :barcode,
      :barcode_prefix          => :barcode_prefix,
      :two_dimensional_barcode => :two_dimensional_barcode,
      :tag_uuid                => :tag_uuid,
      :tag_internal_id         => :tag_internal_id,
      :tag_expected_sequence   => :tag_expected_sequence,
      :tag_map_id              => :tag_map_id,
      :tag_group_name          => :tag_group_name,
      :tag_group_uuid          => :tag_group_uuid,
      :tag_group_internal_id   => :tag_group_internal_id,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end
