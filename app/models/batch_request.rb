class BatchRequest < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id              => :internal_id,
      :batch_uuid               => :batch_uuid,
      :batch_internal_id        => :batch_internal_id,
      :request_uuid             => :request_uuid,
      :request_internal_id      => :request_internal_id,
      :request_type             => :request_type,
      :source_asset_uuid        => :source_asset_uuid,
      :source_asset_internal_id => :source_asset_internal_id,
      :source_asset_name        => :source_asset_name,
      :target_asset_uuid        => :target_asset_uuid,
      :target_asset_internal_id => :target_asset_internal_id,
      :target_asset_name        => :target_asset_name
    }
  end

end
