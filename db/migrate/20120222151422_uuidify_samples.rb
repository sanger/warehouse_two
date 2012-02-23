class UuidifySamples < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :samples, OnlyIndexes(
        [ :is_current, :uuid ],
        [ :is_current, :internal_id ]
      )
    )
  end
end
