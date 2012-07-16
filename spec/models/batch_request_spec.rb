require 'spec_helper'

describe BatchRequest do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid                     => "11111111-2222-3333-4444-555555555555",
      :internal_id              => 1,
      :batch_uuid               => "22222222-3333-4444-5555-666666666666",
      :batch_internal_id        => 2,
      :request_uuid             => "33333333-4444-5555-6666-777777777777",
      :request_internal_id      => 3,
      :request_type             => "request type",
      :source_asset_uuid        => "44444444-5555-6666-7777-888888888888",
      :source_asset_internal_id => 4,
      :source_asset_name        => "source asset name",
      :target_asset_uuid        => "55555555-6666-7777-8888-999999999999",
      :target_asset_internal_id => 5,
      :target_asset_name        => "target asset name",
      :updated_at               => "2012-03-11 10:30:46",
      :created_at               => "2012-03-11 10:30:46"
    }
  end
end
