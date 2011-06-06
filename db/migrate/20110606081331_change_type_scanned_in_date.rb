class ChangeTypeScannedInDate < ActiveRecord::Migration
  def self.up
    change_column :lanes, :scanned_in_date, :date
    change_column :multiplexed_library_tubes, :scanned_in_date, :date
    change_column :pulldown_multiplexed_library_tubes, :scanned_in_date, :date
    change_column :sample_tubes, :scanned_in_date, :date
    change_column :library_tubes, :scanned_in_date, :date
  end

  def self.down
  end
end