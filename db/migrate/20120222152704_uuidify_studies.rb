class UuidifyStudies < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :studies, OnlyIndexes(
        [ :is_current, :uuid ],
        [ :is_current, :internal_id ]
      )
    )
  end
end
