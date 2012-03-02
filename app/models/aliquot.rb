class Aliquot < ActiveRecord::Base
  include ResourceTools

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id            => :id,
      :receptacle_uuid        => :receptacle_uuid,
      :receptacle_internal_id => :receptacle_internal_id,
      :receptacle_type        => :receptacle_type,
      :sample_uuid            => :sample_uuid,
      :sample_internal_id     => :sample_internal_id,
      :study_uuid             => :study_uuid,
      :study_internal_id      => :study_internal_id,
      :project_uuid           => :project_uuid,
      :project_internal_id    => :project_internal_id,
      :receptacle_internal_id => :receptacle_internal_id,
      :receptacle_uuid        => :receptacle_uuid,
      :receptacle_type        => :receptacle_type,
      :tag_uuid               => :tag_uuid,
      :tag_internal_id        => :tag_internal_id,
      :library_uuid           => :library_uuid,
      :library_internal_id    => :library_internal_id,
      :library_type           => :library_type,
      :insert_size_from       => :insert_size_from,
      :insert_size_to         => :insert_size_to
    }
  end

end
