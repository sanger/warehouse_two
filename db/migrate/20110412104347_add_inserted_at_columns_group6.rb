class AddInsertedAtColumnsGroup6 < ActiveRecord::Migration
  def self.up
    add_column :study_samples, :inserted_at, :datetime # big
    add_column :studies,       :inserted_at, :datetime # small

    alter_table(:plates) do
      add_column(:inserted_at, :datetime) # small
      add_index(:inserted_at)
    end
  end

  def self.down
  end
end
