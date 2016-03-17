class AddPrelimIdColumnToStudies < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.string(:prelim_id, :null => true, :default => nil)
    end
  end
end
