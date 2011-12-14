class AddSubmissionToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, "submission_uuid",:string,                   :limit => 36
    add_index :orders, ["submission_uuid"]
  end

  def self.down
    remove_column :orders, :string
  end
end
