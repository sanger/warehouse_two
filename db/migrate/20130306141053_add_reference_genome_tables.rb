class AddReferenceGenomeTables < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    create_resource_table(:reference_genomes) do |t|
      t.string(:name)
    end
  end

  def down
    drop_resource_table(:reference_genomes)
  end
end
