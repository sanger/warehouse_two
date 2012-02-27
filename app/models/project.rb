class Project < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :id,
      :name                    => :name,
      :collaborators           => :collaborators,
      :funding_comments        => :funding_comments,
      :cost_code               => :cost_code,
      :funding_model           => :funding_model,
      :approved                => :approved,
      :budget_division         => :budget_division,
      :external_funding_source => :external_funding_source,
      :project_manager         => :project_manager,
      :budget_cost_centre      => :budget_cost_centre,
      :state                   => :state,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end
