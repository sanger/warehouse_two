class UuidifySamples < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :samples, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :internal_id, :is_current ]
      )
    )
  end
end
