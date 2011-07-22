class Aliquot < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                                 => :uuid,
      :internal_id                          => :id,
      :receptacle_uuid                      => :receptacle_uuid,
      :receptacle_internal_id               => :receptacle_internal_id,
      :receptacle_type                      => :receptacle_type,
      :sample_uuid                          => :sample_uuid,
      :sample_internal_id                   => :sample_internal_i,
      :project_uuid                         => :project_uuid,
      :project_internal_id                  => :project_internal_i,
      :tag_uuid                             => :tag_uuid,
      :tag_internal_id                      => :tag_internal_id,
      :insert_size_from                     => :insert_size_from,
      :insert_size_to                       => :insert_size_to,
      :last_updated                         => :updated_at,
      :created                              => :created_a
    }
  end

end
