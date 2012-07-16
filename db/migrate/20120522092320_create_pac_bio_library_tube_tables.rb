class CreatePacBioLibraryTubeTables < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    create_resource_table(:pac_bio_library_tubes) do |t|
      t.string(:name)
      t.string(:barcode_prefix, :limit => 2)
      t.string(:barcode)
      t.boolean(:closed)
      t.string(:state, :limit => 50)
      t.string(:two_dimensional_barcode)
      t.decimal(:volume, :precision => 5, :scale => 2)
      t.decimal(:concentration, :precision => 5, :scale => 2)
      t.date(:scanned_in_date)
      t.string(:public_name)

      t.string(:prep_kit_barcode)
      t.string(:binding_kit_barcode)
      t.string(:smrt_cells_available)
      t.string(:movie_length)
      t.string(:protocol)
    end
  end

  def down
    drop_resource_table(:pac_bio_library_tubes)
  end
end
