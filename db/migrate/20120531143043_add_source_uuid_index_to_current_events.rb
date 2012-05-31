class AddSourceUuidIndexToCurrentEvents < ActiveRecord::Migration
  def change
    change_table(:current_events) do |t|
      t.index([:source_uuid, :state], :name => :source_uuid_and_state_idx)
    end
  end
end
