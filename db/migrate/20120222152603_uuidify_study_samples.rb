class UuidifyStudySamples < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :study_samples, OnlyIndexes(
        [ :is_current, :sample_uuid, :study_uuid ]
      )
    )
  end
end
