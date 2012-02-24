class UuidifyStudySamples < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :study_samples, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :sample_uuid, :study_uuid, :is_current ]
      )
    )
  end
end
