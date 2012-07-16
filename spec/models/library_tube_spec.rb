require 'spec_helper'

describe LibraryTube do
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
      :volume                      => 3,
      :concentration               => 4,
      :tag_uuid                    => '33333333-4444-5555-6666-777777777777',
      :tag_internal_id             => 5,
      :expected_sequence           => 'expected sequence',
      :tag_map_id                  => 6,
      :tag_group_name              => 'tag group name',
      :tag_group_uuid              => '44444444-5555-6666-7777-888888888888',
      :tag_group_internal_id       => 7,
      :source_request_internal_id  => 8,
      :source_request_uuid         => '55555555-6666-7777-8888-999999999999',
      :library_type                => 'library type',
      :fragment_size_required_from => 9,
      :fragment_size_required_to   => 10,
      :sample_name                 => 'sample name',
      :public_name                 => 'public name',
      :scanned_in_date             => '2011-Mar-10 08:43:00',
      :updated_at                  => '2012-Mar-10 08:43:00',
      :created_at                  => '2012-Mar-10 08:43:00'
    }
  end
end
