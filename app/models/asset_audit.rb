class AssetAudit < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id          => :internal_id,
      :asset_barcode        => :plate_barcode,
      :asset_barcode_prefix => :plate_barcode_prefix,
      :asset_uuid           => :plate_uuid,
      :key                  => :key,
      :created_by           => :created_by,
      :witnessed_by         => :witnessed_by,
      :message              => :message
    }
  end

end
