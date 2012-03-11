require 'spec_helper'

describe BillingEvent do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', {
    :project_division => :division,
    :project_cost_code => :cost_code
  }

  let(:json) do
    {
      :uuid                => "11111111-2222-3333-4444-555555555555",
      :internal_id         => 1,
      :reference           => "reference",
      :project_internal_id => 2,
      :project_uuid        => "22222222-3333-4444-5555-666666666666",
      :project_name        => "project name",
      :project_division    => "division",
      :created_by          => "created by",
      :request_internal_id => 3,
      :request_uuid        => "33333333-4444-5555-6666-777777777777",
      :request_type        => "request type",
      :library_type        => "library type",
      :project_cost_code   => "cost code",
      :price               => 4,
      :quantity            => "quantity",
      :kind                => "kind",
      :description         => "description",
      :entry_date          => "2012-03-11 10:28:28",
      :updated_at          => "2012-03-11 10:28:28",
      :created_at          => "2012-03-11 10:28:28"
    }
  end
end
