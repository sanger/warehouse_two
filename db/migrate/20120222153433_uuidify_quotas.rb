class UuidifyQuotas < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :quotas, OnlyIndexes(
        [ :is_current, :project_uuid, :request_type ]
      )
    )
  end
end
