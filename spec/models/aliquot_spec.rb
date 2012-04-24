require 'spec_helper'

describe Aliquot do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id
  it_behaves_like 'ignores JSON fields', [ :sample_url, :receptacle_url, :project_url, :study_url, :library_url, :tag_url ]

  let(:json) do
    {
      :uuid                     => '11111111-2222-3333-4444-555555555555',
      :id                       => 1,
      :receptacle_uuid          => '22222222-3333-4444-5555-666666666666',
      :receptacle_internal_id   => 2,
      :study_uuid               => '33333333-4444-5555-6666-777777777777',
      :study_internal_id        => 3,
      :project_uuid             => '44444444-5555-6666-7777-888888888888',
      :project_internal_id      => 4,
      :library_uuid             => '55555555-6666-7777-8888-999999999999',
      :library_internal_id      => 5,
      :sample_uuid              => '66666666-7777-8888-9999-000000000000',
      :sample_internal_id       => 6,
      :tag_uuid                 => '77777777-8888-9999-0000-111111111111',
      :tag_internal_id          => 7,
      :receptacle_type          => 'receptacle type',
      :library_type             => 'library type',
      :insert_size_from         => 8,
      :insert_size_to           => 9,
      :updated_at               => '2012-Mar-10 08:43:00',
      :created_at               => '2012-Mar-10 08:43:00',
      :bait_name                => 'bait library name',
      :bait_target_species      => 'bait library target species',
      :bait_supplier_identifier => 'bait library supplier identifier',
      :bait_supplier_name       => 'bait library supplier name'
    }
  end
end
