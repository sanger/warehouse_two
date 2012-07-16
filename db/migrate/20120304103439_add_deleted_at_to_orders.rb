class AddDeletedAtToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :deleted_at, :datetime
  end

  def self.down
    remove_column :orders, :deleted_at
  end
end
