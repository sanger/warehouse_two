class AddPriorityAndUserToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :priority, :integer 
    add_column :requests, :user, :string
    
    add_index :requests, :priority
    add_index :requests, :user
  end

  def self.down
    remove_column :requests, :user
    remove_column :requests, :priority
  end
end