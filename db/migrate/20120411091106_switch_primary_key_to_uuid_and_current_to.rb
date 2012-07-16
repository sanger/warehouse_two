class SwitchPrimaryKeyToUuidAndCurrentTo < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      change_table(table, :bulk => true) do |t|
        t.remove(:dont_use_id)
        t.remove_index(:name => :current_to_and_uuid_and_current_from_idx)
        t.index([:current_to, :uuid, :current_from], :name => "primary_partitioning_key", :unique => true)
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Cannot put dont_use_id back into tables!"
  end
end
