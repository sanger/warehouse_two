class AlterBarcodeIndexesOnPlates < ActiveRecord::Migration
  def up
    change_table(:current_plates, :bulk => true) do |t|
      t.index([:infinium_barcode, :barcode], :name => :infinium_barcode_and_barcode_idx)
      t.index([:barcode], :name => :barcode_idx)
      t.remove_index(:name => :barcode_and_infinium_barcode_idx)
    end
  end

  def down
    change_table(:current_plates, :bulk => true) do |t|
      t.remove_index(:name => :infinium_barcode_and_barcode_idx)
      t.remove_index(:name => :barcode_idx)
      t.index([:barcode, :infinium_barcode], :name => :barcode_and_infinium_barcode_idx)
    end
  end
end
