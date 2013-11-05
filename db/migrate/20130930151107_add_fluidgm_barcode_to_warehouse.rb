class AddFluidgmBarcodeToWarehouse < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:plates) do |t|
      t.string(:fluidigm_barcode, :null => true, :default => nil)
    end
  end
end
