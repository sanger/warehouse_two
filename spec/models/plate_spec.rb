require 'spec_helper'

describe Plate do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id, :size => :plate_size

  let(:json) do
    {
      :uuid                      => "33333333-4444-5555-6666-777777777777",
      :id                        => 4,
      :name                      => "name",
      :barcode                   => "barcode",
      :barcode_prefix            => "bp",
      :size                      => 5,
      :updated_at                => "2012-03-11 10:13:30",
      :created_at                => "2012-03-11 10:13:30",
      :plate_purpose_name        => "plate purpose name",
      :plate_purpose_internal_id => 6,
      :plate_purpose_uuid        => "44444444-5555-6666-7777-888888888888",
      :infinium_barcode          => "infinium barcode",
      :location                  => "location"
    }
  end
end
