class AddInsertedAtColumnsGroup4 < ActiveRecord::Migration
  def self.up
    add_column :batch_requests, :inserted_at, :datetime # medium

    alter_table(:requests) do
      add_column(:inserted_at, :datetime) # big
      add_index(:inserted_at)
    end
  end

  def self.down
  end
end
