class AddPublicNameToLibrarys < ActiveRecord::Migration
  def self.up
    add_column :library_tubes, :public_name, :string
    add_column :multiplexed_library_tubes, :public_name, :string
    add_column :pulldown_multiplexed_library_tubes, :public_name, :string
  end

  def self.down
    remove_column :pulldown_multiplexed_library_tubes, :public_name
    remove_column :multiplexed_library_tubes, :public_name
    remove_column :library_tubes, :public_name
  end
end