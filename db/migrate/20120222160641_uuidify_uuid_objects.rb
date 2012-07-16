class UuidifyUuidObjects < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :uuid_objects, OnlyIndexes(
        [ :uuid ]
      )
    )
  end
end
