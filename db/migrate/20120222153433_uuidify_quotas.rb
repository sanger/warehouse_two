class UuidifyQuotas < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :quotas, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :project_uuid, :request_type, :is_current ]
      )
    )
  end
end
