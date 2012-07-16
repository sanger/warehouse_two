class UuidifyOrders < ActiveRecord::Migration
  extend Uuidable::Migration

  # The indexes here look odd but people query for study a lot (so they get to requests),
  # but project rarely, and so it's probably good just to stick that at the end.
  def self.up
    uuidify_table(
      :orders, OnlyIndexes(
        [ :uuid, :is_current ],
        [ :study_uuid, :is_current, :project_uuid ]
      )
    )
  end
end
