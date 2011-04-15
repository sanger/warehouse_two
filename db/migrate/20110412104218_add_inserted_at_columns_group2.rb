class AddInsertedAtColumnsGroup2 < ActiveRecord::Migration
  def self.up
    add_column :library_tubes,                      :inserted_at, :datetime # big
    add_column :asset_freezers,                     :inserted_at, :datetime # small
    add_column :pulldown_multiplexed_library_tubes, :inserted_at, :datetime # small
    add_column :tags,                               :inserted_at, :datetime # small
  end

  def self.down
  end
end
