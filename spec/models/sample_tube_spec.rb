require 'spec_helper'

describe SampleTube do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id, :qc_state => :state

  let(:json) do
    {
      :uuid                        => '11111111-2222-3333-4444-555555555555',
      :id                          => 1,
      :name                        => 'name',
      :barcode                     => 'barcode',
      :barcode_prefix              => 'bp',
      :closed                      => true,
      :qc_state                    => 'qc state',
      :two_dimensional_barcode     => 'two dimensional barcode',
      :sample_uuid                 => '22222222-3333-4444-5555-666666666666',
      :sample_internal_id          => 2,
      :sample_name                 => 'sample name',
      :volume                      => 3,
      :concentration               => 4,
      :scanned_in_date             => '2011-Mar-10 08:43:00',
      :updated_at                  => '2012-Mar-10 08:43:00',
      :created_at                  => '2012-Mar-10 08:43:00'
    }
  end
end
