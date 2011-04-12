class AddInsertedAtColumnsGroup3 < ActiveRecord::Migration
  def self.up
    add_column :multiplexed_library_tubes, :inserted_at, :datetime # big
    add_column :batches,                   :inserted_at, :datetime # small

    alter_table(:plate_purposes) do
      add_column(:inserted_at, :datetime) # small
      add_index(:inserted_at)
    end
  end

  def self.down
  end
end
