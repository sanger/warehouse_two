class DropAllButTimestampIndexesFromNormalTables < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      change_table(table, :bulk => true) do |t|
        indexes(table).each do |index|
          t.remove_index(:name => index.name)
        end
      end
      change_table(table) do |t|
        t.index(['uuid', 'current_from', 'current_to'], :unique => true, :name => 'uuid_and_current_from_and_current_to_idx')
      end
    end
  end

  def down
    # There is no reason to rebuild the indexes that have been removed
  end
end
