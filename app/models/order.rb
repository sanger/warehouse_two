class Order < ActiveRecord::Base
  include ResourceTools

  ignore_attribute(
    :submission_internal_id,
    :project_internal_id,
    :study_internal_id,
    :asset_uuids
  )

  REMAPPING_OPTIONS = {
    :read_length                     => :read_length,
    [:fragment_size_required, :from] => :fragment_size_required_from,
    [:fragment_size_required, :to]   => :fragment_size_required_to,
    :library_type                    => :library_type,
    :sequencing_type                 => :sequencing_type,
    :insert_size                     => :insert_size,
    :number_of_lanes                 => :number_of_lanes
  }

  def request_options=(values)
    REMAPPING_OPTIONS.each do |methods, attribute|
      self[attribute] = Array(methods).inject(values) { |v,m| v.try(:send, m) }
    end
  end

  # Override the behaviour so that we check that the submitted assets have not changed.
  def updated_values?(order)
    super or submitted_assets_have_changed?(order)
  end

  def submitted_assets_have_changed?(order)
    asset_uuids = order.data.asset_uuids || []
    SubmittedAsset.for_order(self).map(&:asset_uuid).sort != asset_uuids.sort
  end
  private :submitted_assets_have_changed?

  # Whenever we create a submission we need to ensure that the submitted assets are maintained.
  after_create :generate_submitted_assets

  def generate_submitted_assets
    SubmittedAsset.for_order(self).map(&:destroy)
    return unless data.asset_uuids?

    asset_uuids = data.asset_uuids.reject(&:blank?).map do |uuid|
      { :order_uuid => self.uuid, :asset_uuid => uuid }
    end
    SubmittedAsset.create!(asset_uuids) unless asset_uuids.empty?
  end
  private :generate_submitted_assets
end
