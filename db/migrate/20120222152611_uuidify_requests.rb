class UuidifyRequests < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :requests, OnlyIndexes(
        [ :is_current, :source_asset_uuid, :request_type ],
        [ :is_current, :target_asset_uuid, :request_type ]
      )
    )
  end
end
