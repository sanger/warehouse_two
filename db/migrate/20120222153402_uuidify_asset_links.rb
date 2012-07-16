class UuidifyAssetLinks < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :asset_links, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :ancestor_uuid, :descendant_uuid, :is_current ]
      )
    )
  end
end
