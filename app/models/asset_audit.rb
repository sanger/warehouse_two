class AssetAudit < ActiveRecord::Base
  include ResourceTools

  json do
    whitelist(*AssetAudit.attribute_names)
    translate(
      :plate_barcode        => :asset_barcode,
      :plate_barcode_prefix => :asset_barcode_prefix,
      :plate_uuid           => :asset_uuid
    )
  end
end
