class AddInsertedAtColumnsGroup5 < ActiveRecord::Migration
  def self.up
    add_column :quotas, :inserted_at, :datetime # small
    add_column :lanes,  :inserted_at, :datetime # small

    alter_table(:samples) do
      add_column(:inserted_at, :datetime) # big
      add_index(:inserted_at)
    end
  end

  def self.down
  end
end
