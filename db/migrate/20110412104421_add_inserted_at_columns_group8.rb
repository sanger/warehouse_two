class AddInsertedAtColumnsGroup8 < ActiveRecord::Migration
  def self.up
    add_column :sample_tubes,   :inserted_at, :datetime # big
    add_column :billing_events, :inserted_at, :datetime # medium
  end

  def self.down
  end
end
