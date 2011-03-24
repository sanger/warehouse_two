class AddSupplierNameToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :supplier_name, :string
    add_index :samples, :supplier_name
  end

  def self.down
    remove_column :samples, :supplier_name
  end
end