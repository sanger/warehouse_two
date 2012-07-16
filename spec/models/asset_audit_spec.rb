require 'spec_helper'

describe AssetAudit do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', {
    :plate_barcode        => :asset_barcode,
    :plate_barcode_prefix => :asset_barcode_prefix,
    :plate_uuid           => :asset_uuid
  }

  let(:json) do
    {
      :uuid                 => '11111111-2222-3333-4444-555555555555',
      :internal_id          => 1,
      :key                  => 'key',
      :message              => 'message',
      :created_by           => 'created by',
      :plate_barcode        => 'plate barcode',
      :plate_barcode_prefix => 'bp',
      :plate_uuid           => '22222222-3333-4444-5555-666666666666',
      :witnessed_by         => 'witnessed by',
      :updated_at           => '2012-Mar-10 08:43:00',
      :created_at           => '2012-Mar-10 08:43:00'
    }
  end
end
