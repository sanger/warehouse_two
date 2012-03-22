require 'spec_helper'

describe Project do
  it_behaves_like 'a resource'
  it_behaves_like 'maps JSON fields', :id => :internal_id
  it_behaves_like 'ignores JSON fields', [ :manager, :follower, :administrator ]

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
      :manager                 => [ { :name => "manager name",       :email => "manager email",       :login => "manager login"  } ],
      :follower                => [ { :name => "follower name",      :email => "follower email",      :login => "follower login" } ],
      :administrator           => [ { :name => "administrator name", :email => "administrator email", :login => "administrator login" } ],
      :updated_at              => "2012-03-11 10:27:30",
      :created_at              => "2012-03-11 10:27:30"
    }
  end
end
