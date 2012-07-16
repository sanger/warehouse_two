require 'spec_helper'

describe Project do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id

  it_behaves_like 'associated with roles'

  let(:json) do
    {
      :uuid                    => "11111111-2222-3333-4444-555555555555",
      :id                      => 1,
      :name                    => "name",
      :collaborators           => "collaborators",
      :funding_comments        => "funding comments",
      :cost_code               => "cost code",
      :funding_model           => "funding model",
      :approved                => true,
      :budget_division         => "budget division",
      :external_funding_source => "external funding source",
      :project_manager         => "project manager",
      :budget_cost_centre      => "budget cost centre",
      :state                   => "state",
      :updated_at              => "2012-03-11 10:27:30",
      :created_at              => "2012-03-11 10:27:30"
    }
  end
end
