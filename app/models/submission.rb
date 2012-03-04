class Submission < ActiveRecord::Base
  include ResourceTools

  # Override the behaviour so that we check that the submitted assets have not changed.
  def updated_values?(submission)
    super or submitted_assets_have_changed?(submission)
  end

  def submitted_assets_have_changed?(submission)
    SubmittedAsset.for_submission(self).map(&:asset_uuid).sort != submission.data.asset_uuids.sort
  end
  private :submitted_assets_have_changed?

  # Whenever we create a submission we need to ensure that the submitted assets are maintained.
  after_create :generate_submitted_assets

  def generate_submitted_assets
    SubmittedAsset.for_submission(self).map(&:destroy)
    return unless data.asset_uuids?

    asset_uuids = data.asset_uuids.reject(&:blank?).map do |uuid|
      { :submission_uuid => self.uuid, :asset_uuid => uuid }
    end
    SubmittedAsset.create!(asset_uuids) unless asset_uuids.empty?
  end
  private :generate_submitted_assets

  def self.map_internal_to_external_attributes
    # Internal DB column => External resource method
    {
      :internal_id                 => :internal_id,
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
