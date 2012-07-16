require 'spec_helper'

describe Quota do
  it_behaves_like 'a resource'

  let(:json) do
    {
      :uuid                => '11111111-2222-3333-4444-555555555555',
      :internal_id         => 1,
      :quota_limit         => 2,
      :request_type        => 'request type',
      :project_internal_id => 3,
      :project_uuid        => '22222222-3333-4444-5555-666666666666',
      :project_name        => 'project name'
    }
  end
end
