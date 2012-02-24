class UuidifyStudies < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :studies, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :internal_id, :is_current ]
      )
    )
  end
end
