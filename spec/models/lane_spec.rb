require 'spec_helper'

describe Lane do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :qc_state => :state

  let(:json) do
    {
      :uuid                    => '11111111-2222-3333-4444-555555555555',
      :internal_id             => 1,
      :name                    => 'name',
      :barcode                 => 'barcode',
      :barcode_prefix          => 'bp',
      :closed                  => true,
      :qc_state                => 'qc state',
      :two_dimensional_barcode => 'two dimensional barcode',
      :external_release        => false,
      :scanned_in_date         => '2011-Mar-10 08:43:00',
      :updated_at              => '2012-Mar-10 08:43:00',
      :created_at              => '2012-Mar-10 08:43:00'
    }
  end
end
