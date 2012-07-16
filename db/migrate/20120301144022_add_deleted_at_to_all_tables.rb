class AddDeletedAtToAllTables < ActiveRecord::Migration
  ALL_TABLES = [
    :aliquots,
    :asset_audits,
    :asset_links,
    :batch_requests,
    :batches,
    :billing_events,
    :events,
    :lanes,
    :library_tubes,
    :multiplexed_library_tubes,
    :plate_purposes,
    :plates,
    :projects,
    :pulldown_multiplexed_library_tubes,
    :quotas,
    :requests,
    :sample_tubes,
    :samples,
    :studies,
    :study_samples,
    :submissions,
    :submitted_assets,
    :tags,
    :wells
  ]

  def self.up
    ALL_TABLES.each do |name|
      add_column(name, :deleted_at, :datetime)
    end
  end

  def self.down
    ALL_TABLES.each do |name|
      remove_column(name, :deleted_at)
    end
  end
end
