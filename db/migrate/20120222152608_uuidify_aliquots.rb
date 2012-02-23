class UuidifyAliquots < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :aliquots, OnlyIndexes(
        [ :is_current, :sample_uuid, :receptacle_uuid ]
      )
    )
  end
end
