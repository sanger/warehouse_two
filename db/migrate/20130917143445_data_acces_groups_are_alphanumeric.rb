class DataAccesGroupsAreAlphanumeric < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.change(:data_access_group, :string, :null => true, :default => nil)
    end
  end
end
