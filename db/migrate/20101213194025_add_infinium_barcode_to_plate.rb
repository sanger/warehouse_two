class AddInfiniumBarcodeToPlate < ActiveRecord::Migration
  def self.up
    add_column :plates, :infinium_barcode, :string
    add_index :plates, :infinium_barcode
  end

  def self.down
    remove_column :plates, :infinium_barcode
  end
end