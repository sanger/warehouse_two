class AddBaitLibraryInformationToAliquots < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:aliquots, :bulk => true) do |t|
      t.column(:bait_name, :string)
      t.column(:bait_target_species, :string)
      t.column(:bait_supplier_identifier, :string)
      t.column(:bait_supplier_name, :string)
    end
  end
end
