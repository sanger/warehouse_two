class AddDisplayNameToWells < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table('wells') do |t|
      t.column(:display_name, :string, :limit => 15)
    end
  end
end
