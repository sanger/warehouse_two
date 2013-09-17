class AddDataAccessGroupField < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.string(:data_access_group, :null => true, :default => nil)
    end
  end
end
