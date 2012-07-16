class DropIsCurrentIndexes < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      change_table(table, :bulk => true) do |t|
        connection.indexes(table).select do |index|
          index.name =~ /_is_current_/
        end.each do |index|
          t.remove_index(:name => index.name)
        end
      end
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Cannot rebuild is_current indexes"
  end
end
