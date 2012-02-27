class Batch < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                    => :uuid,
      :internal_id             => :id,
      :created_by              => :created_by,
      :assigned_to             => :assigned_to,
      :pipeline_name           => :pipeline_name,
      :pipeline_uuid           => :pipeline_uuid,
      :pipeline_internal_id    => :pipeline_internal_id,
      :state                   => :state,
      :qc_state                => :qc_state,
      :production_state        => :production_state,
      :last_updated            => :updated_at,
      :created                 => :created_at
    }
  end

end
