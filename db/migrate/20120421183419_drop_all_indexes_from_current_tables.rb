class DropAllIndexesFromCurrentTables < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      change_table("current_#{table}", :bulk => true) do |t|
        indexes(table).each do |index|
          t.remove_index(:name => index.name)
        end
        t.index([ 'uuid' ], :unique => true, :name => 'uuid_idx')
        t.index([ 'internal_id' ], :unique => true, :name => 'internal_id_idx') unless table == 'asset_links'
      end
    end
  end

  def down
    # There is no reason to rebuild the indexes on the current tables
  end
end
