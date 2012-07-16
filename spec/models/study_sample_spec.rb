require 'spec_helper'

describe StudySample do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id
  it_behaves_like 'ignores JSON fields', [ :studies, :samples ]

  let(:json) do
    {
      :uuid => "11111111-2222-3333-4444-555555555555",
      :id => 1,
      :sample_internal_id => 2,
      :sample_uuid => "22222222-3333-4444-5555-666666666666",
      :study_internal_id => 3,
      :study_uuid => "33333333-4444-5555-6666-777777777777",
      :updated_at => "2012-03-11 10:22:07",
      :created_at => "2012-03-11 10:22:07"
    }
  end
end
