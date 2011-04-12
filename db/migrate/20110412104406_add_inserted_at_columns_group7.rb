class AddInsertedAtColumnsGroup7 < ActiveRecord::Migration
  def self.up
    add_column :events, :inserted_at, :datetime # medium

    alter_table(:wells) do
      add_column(:inserted_at, :datetime) # big
      add_index(:inserted_at)
    end
  end

  def self.down
  end
end
