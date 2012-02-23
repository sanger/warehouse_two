class UuidifySubmittedAssets < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :submitted_assets, OnlyIndexes(
        [ :submission_uuid, :asset_uuid ]
      )
    )
  end
end
