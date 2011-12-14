class Order < ActiveRecord::Base
  include ResourceTools
  
  def self.link_resources(resource_object)
  end
  
  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :uuid                        => :uuid,
      :internal_id                 => :internal_id,
      :last_updated                => :updated_at,
      :created                     => :created_at,
      :created_by                  => :created_by,
      :template_name               => :template_name,
      :study_name                  => :study_name,
      :study_uuid                  => :study_uuid,
      :project_name                => :project_name,
      :project_uuid                => :project_uuid,
      :submission_uuid             => :submission_uuid,
      :comments                    => :comments,
      :read_length                 => [:request_options, :read_length],
      :fragment_size_required_from => [:request_options, :fragment_size_required, :from],
      :fragment_size_required_to   => [:request_options, :fragment_size_required, :to],
      :library_type                => [:request_options, :library_type],
      :sequencing_type             => [:request_options, :sequencing_type],
      :insert_size                 => [:request_options, :insert_size],
      :number_of_lanes             => [:request_options, :number_of_lanes]
    }
  end

end
