require 'spec_helper'

describe Request do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', {
    :id => :internal_id,
    :fragment_size_required_from => :fragment_size_from,
    :fragment_size_required_to => :fragment_size_to
  }
  it_behaves_like 'ignores JSON fields', [
    :project_url,
    :study_url,
    :submission_url
  ]

  let(:json) do
    {
      :uuid => "11111111-2222-3333-4444-555555555555",
      :id => 1,
      :request_type => "request type",
      :fragment_size_required_from => "fragment size from",
      :fragment_size_required_to => "fragment size to",
      :read_length => 2,
      :library_type => "library type",
      :study_uuid => "22222222-3333-4444-5555-666666666666",
      :study_internal_id => 3,
      :study_name => "study name",
      :project_uuid => "33333333-4444-5555-6666-777777777777",
      :project_internal_id => 4,
      :project_name => "project name",
      :source_asset_uuid => "44444444-5555-6666-7777-888888888888",
      :source_asset_internal_id => 5,
      :source_asset_type => "source asset type",
      :source_asset_name => "source asset name",
      :source_asset_barcode => "source asset barcode",
      :source_asset_barcode_prefix => "source asset barcode prefix",
      :source_asset_state => "source asset state",
      :source_asset_closed => true,
      :source_asset_two_dimensional_barcode => "source asset two dimensional barcode",
      :source_asset_sample_uuid => "55555555-6666-7777-8888-999999999999",
      :source_asset_sample_internal_id => 6,
      :target_asset_uuid => "66666666-7777-8888-9999-000000000000",
      :target_asset_internal_id => 7,
      :target_asset_type => "target asset type",
      :target_asset_name => "target asset name",
      :target_asset_barcode => "target asset barcode",
      :target_asset_barcode_prefix => "target asset barcode prefix",
      :target_asset_state => "target asset state",
      :target_asset_closed => true,
      :target_asset_two_dimensional_barcode => "target asset two dimensional barcode",
      :target_asset_sample_uuid => "77777777-8888-9999-0000-111111111111",
      :target_asset_sample_internal_id => 8,
      :updated_at => "2012-03-11 10:18:19",
      :created_at => "2012-03-11 10:18:19",
      :state => "state",
      :priority => 9,
      :user => "user",
      :submission_uuid => "88888888-9999-0000-1111-222222222222",
      :submission_internal_id => 10
    }
  end
end
