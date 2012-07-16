class UuidifyBillingEvents < ActiveRecord::Migration
  extend Uuidable::Migration

  def self.up
    uuidify_table(
      :billing_events, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :project_uuid, :request_uuid, :is_current ]
      )
    )
  end
end

