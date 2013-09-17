class AddDataAccessGroupField < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.boolean(:data_access_group, :null => false, :default => false)
    end
  end
end
