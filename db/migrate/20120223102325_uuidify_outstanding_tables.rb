class UuidifyOutstandingTables < ActiveRecord::Migration
  extend Uuidable::Migration

  TABLES = [
    :asset_audits,
    :asset_freezers,
    :batch_requests,
    :batches,
    :events,
    :lanes,
    :library_tubes,
    :multiplexed_library_tubes,
    :plate_purposes,
    :plates,
    :projects,
    :pulldown_multiplexed_library_tubes,
    :sample_tubes,
    :wells
  ]

  def self.up
    TABLES.map(&method(:uuidify_table))
  end
end
