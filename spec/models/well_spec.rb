require 'spec_helper'

describe Well do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid                    => "11111111-2222-3333-4444-555555555555",
      :internal_id             => 1,
      :name                    => "name",
      :map                     => "map",
      :plate_barcode           => "plate barcode",
      :plate_barcode_prefix    => "pb",
      :display_name            => "pb123456k",
      :sample_uuid             => "22222222-3333-4444-5555-666666666666",
      :sample_internal_id      => 2,
      :sample_name             => "sample name",
      :gel_pass                => "gel pass",
      :concentration           => "concentration",
      :current_volume          => "current volume",
      :buffer_volume           => "buffer volume",
      :requested_volume        => "requested volume",
      :picked_volume           => "picked volume",
      :pico_pass               => "pico pass",
      :updated_at              => "2012-03-11 10:21:31",
      :created_at              => "2012-03-11 10:21:31",
      :plate_uuid              => "33333333-4444-5555-6666-777777777777",
      :measured_volume         => "measured volume",
      :sequenom_count          => 3,
      :gender_markers          => "gender markers",
      :genotyping_status       => "genotyping status",
      :genotyping_snp_plate_id => "genotyping snp plate id"
    }
  end
end
