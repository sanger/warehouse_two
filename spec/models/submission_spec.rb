require 'spec_helper'

describe Submission do
  it_behaves_like 'a resource'
  it_behaves_like 'ignores JSON fields', [
    :study_uuid,
    :study_internal_id,
    :study_name,
    :project_uuid,
    :project_internal_id,
    :project_name,
    :orders
  ]

  let(:json) do
    {
      :uuid        => "11111111-2222-3333-4444-555555555555",
      :internal_id => 1,
      :updated_at  => "2012-03-11 10:30:04",
      :created_at  => "2012-03-11 10:30:04",
      :created_by  => "created by",
      :state       => "state",
      :message     => "message"
    }
  end
end
