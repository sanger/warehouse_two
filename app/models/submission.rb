class Submission < ActiveRecord::Base
  include ResourceTools

  def self.link_resources(resource_object)
    lc_class_name = self.model_name.underscore
    resource = resource_object.send(lc_class_name)
    return unless resource.respond_to?(:asset_uuids) and not resource.asset_uuids.blank?

    asset_uuids   = resource.asset_uuids.reject(&:blank?)
    present_uuids = SubmittedAsset.for_submission(resource).map(&:asset_uuid)
    SubmittedAsset.create!(
      (asset_uuids-present_uuids).map do |uuid|
        { :submission_uuid => resource.uuid, :asset_uuid => uuid }
      end
    )
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
      :state                       => :state,
      :study_name                  => :study_name,
      :study_uuid                  => :study_uuid,
      :project_name                => :project_name,
      :project_uuid                => :project_uuid,
      :message                     => :message,
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
