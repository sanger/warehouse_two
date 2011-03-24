class AddBarcodePrefix < ActiveRecord::Migration
  def self.up
    add_column :sample_tubes, :barcode_prefix, :string, :limit => 2
    add_index :sample_tubes, :barcode_prefix
  end

  def self.down
    remove_column :sample_tubes, :barcode_prefix
  end
end