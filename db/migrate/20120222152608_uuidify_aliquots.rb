class UuidifyAliquots < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :aliquots, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :sample_uuid, :receptacle_uuid, :is_current ]
      )
    )
  end
end
