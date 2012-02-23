class UuidifyTags < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :tags, OnlyIndexes(
        [ :is_current, :uuid ]
      )
    )
  end
end
