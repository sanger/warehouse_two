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
    :wells,
    :tags
  ]

  def self.up
    TABLES.each { |name| uuidify_table(name, OnlyIndexes([ :uuid, :is_current ])) }
  end
end
