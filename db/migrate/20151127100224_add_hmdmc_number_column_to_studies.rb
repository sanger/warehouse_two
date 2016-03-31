class AddHmdmcNumberColumnToStudies < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.string(:hmdmc_number, :null => true, :default => nil)
    end
  end
end
