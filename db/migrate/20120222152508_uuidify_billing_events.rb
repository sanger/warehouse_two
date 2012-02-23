class UuidifyBillingEvents < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :billing_events, OnlyIndexes(
        [ :is_current, :project_uuid, :request_uuid ]
      )
    )
  end
end

