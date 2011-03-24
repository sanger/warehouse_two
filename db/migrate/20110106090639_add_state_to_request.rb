class AddStateToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :state, :string, :limit => 40
    add_index :requests, :state
  end

  def self.down
    remove_column :requests, :state
  end
end