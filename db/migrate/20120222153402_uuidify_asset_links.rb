class UuidifyAssetLinks < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :asset_links, OnlyIndexes(
        [ :is_current, :ancestor_uuid, :descendant_uuid ],
        [ :is_current, :descendant_uuid, :ancestor_uuid ]
      )
    )
  end
end
