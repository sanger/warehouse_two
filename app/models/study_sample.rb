class StudySample < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id         => :id,
      :sample_internal_id  => :sample_internal_id,
      :sample_uuid         => :sample_uuid,
      :study_internal_id   => :study_internal_id,
      :study_uuid          => :study_uuid
    }
  end
  
end
