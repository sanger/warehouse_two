class UuidifySubmissions < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :submissions, OnlyIndexes(
        [ :is_current, :uuid ],
        [ :is_current, :project_uuid ],
        [ :is_current, :study_uuid, :project_uuid ]
      )
    )
  end
end
