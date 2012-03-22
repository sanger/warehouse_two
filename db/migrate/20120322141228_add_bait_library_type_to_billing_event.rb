class AddBaitLibraryTypeToBillingEvent < ActiveRecord::Migration
  def self.up
    add_column :billing_events, :bait_library_type, :string
  end

  def self.down
    remove_column :billing_events, :bait_library_type
  end
end
