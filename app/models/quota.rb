class Quota < ActiveRecord::Base
  include ResourceTools

  def self.link_resources(resource_object)
  end

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                => :uuid,
      :internal_id         => :internal_id,
      :quota_limit         =>:quota_limit,
      :request_type        => :request_type  ,
      :project_internal_id =>:project_internal_id,
      :project_uuid        =>:project_uuid ,
      :project_name        =>:project_name,
      :last_updated        => :updated_at,
      :created             => :created_at
    }
  end
  
end