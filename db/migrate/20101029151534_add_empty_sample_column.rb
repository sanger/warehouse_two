class AddEmptySampleColumn < ActiveRecord::Migration
  def self.up
    add_column :samples, :empty_supplier_sample_name, :boolean
    add_index :samples, :empty_supplier_sample_name
  end

  def self.down
    remove_column :samples, :empty_supplier_sample_name
  end
end