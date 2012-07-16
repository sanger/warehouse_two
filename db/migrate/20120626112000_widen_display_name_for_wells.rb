class WidenDisplayNameForWells < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    change_resource_table(:wells) do |t|
      t.change(:display_name, :string, :limit => 20)
    end
  end

  def down
    # No change is really needed here as we've only widened the column
  end
end
