require 'spec_helper'

describe Event do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', {
    :eventful_internal_id => :source_internal_id,
    :eventful_uuid        => :source_uuid,
    :eventful_type        => :source_type
  }
  it_behaves_like 'ignores JSON fields', [ :family ]

  let(:json) do
    {
      :uuid                 => '11111111-2222-3333-4444-555555555555',
      :internal_id          => 1,
      :eventful_internal_id => 2,
      :eventful_uuid        => '22222222-3333-4444-5555-666666666666',
      :eventful_type        => 'eventful type',
      :message              => 'message',
      :state                => 'state',
      :identifier           => 'identifier',
      :location             => 'location',
      :actioned             => true,
      :content              => 'content',
      :created_by           => 'created by',
      :of_interest_to       => 'of interest to',
      :descriptor_key       => 'descriptor key',
      :updated_at           => '2012-Mar-10 08:43:00',
      :created_at           => '2012-Mar-10 08:43:00'
    }
  end
end
