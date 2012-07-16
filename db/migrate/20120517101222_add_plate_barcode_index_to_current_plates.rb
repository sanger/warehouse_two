class AddPlateBarcodeIndexToCurrentPlates < ActiveRecord::Migration
  def change
    change_table(:current_plates) do |t|
      t.index([:barcode, :infinium_barcode], :name => :barcode_and_infinium_barcode_idx)
    end
  end
end
