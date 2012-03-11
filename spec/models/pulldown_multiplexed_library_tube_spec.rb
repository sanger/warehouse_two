require 'spec_helper'

describe PulldownMultiplexedLibraryTube do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid                    => "11111111-2222-3333-4444-555555555555",
      :internal_id             => 1,
      :name                    => "name",
      :barcode                 => "barcode",
      :barcode_prefix          => "bp",
      :state                   => "state",
      :closed                  => true,
      :concentration           => "concentration",
      :volume                  => "volume",
      :two_dimensional_barcode => "two dimensional barcode",
      :scanned_in_date         => "scanned in date",
      :updated_at              => "2012-03-11 10:17:35",
      :created_at              => "2012-03-11 10:17:35",
      :public_name             => "public name"
    }
  end
end
