class AddRemoveXAndAutosomes < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.boolean(:remove_x_and_autosomes, :null => false, :default => false)
    end
  end
end
