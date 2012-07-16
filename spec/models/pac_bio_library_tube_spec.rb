require 'spec_helper'

describe PacBioLibraryTube do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id, :qc_state => :state

  let(:json) do
    {
      :uuid                    => "11111111-2222-3333-4444-555555555555",
      :id                      => 1,
      :name                    => "name",
      :barcode                 => "barcode",
      :barcode_prefix          => "bp",
      :closed                  => true,
      :qc_state                => "state",
      :two_dimensional_barcode => "two dimensional barcode",
      :volume                  => "volume",
      :prep_kit_barcode        => "prep kit barcode",
      :binding_kit_barcode     => "binding kit barcode",
      :smrt_cells_available    => "smrt cells available",
      :movie_length            => "movie length",
      :protocol                => "protocol",
      :concentration           => "concentration",
      :scanned_in_date         => "scanned in date",
      :updated_at              => "2012-03-11 10:26:09",
      :created_at              => "2012-03-11 10:26:09",
      :public_name             => "public name"
    }
  end
end
