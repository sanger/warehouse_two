require 'spec_helper'

describe Tag do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid                  => '11111111-2222-3333-4444-555555555555',
      :internal_id           => 1,
      :expected_sequence     => 'ACGT',
      :map_id                => 2,
      :tag_group_name        => 'tag group name',
      :tag_group_uuid        => '22222222-3333-4444-5555-666666666666',
      :tag_group_internal_id => 3,
      :updated_at            => '2012-Mar-06 11:35:00',
      :created_at            => '2012-Mar-06 11:35:00'
    }
  end
end
