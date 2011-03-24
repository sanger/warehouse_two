class BillingEvent < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :internal_id,
      :reference               => :reference,
      :project_internal_id     => :project_internal_id,
      :project_uuid            => :project_uuid,
      :project_name            => :project_name,
      :division                => :project_division,
      :created_by              => :created_by,
      :request_internal_id     => :request_internal_id,
      :request_uuid            => :request_uuid,
      :request_type            => :request_type,
      :library_type            => :library_type,
      :price                   => :price,
      :cost_code               => :project_cost_code,
      :quantity                => :quantity,
      :kind                    => :kind,
      :description             => :description,
      :entry_date              => :entry_date,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end