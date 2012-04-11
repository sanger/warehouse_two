class PartitionTablesOnCurrentTo < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      partition_table(table, %q{
        PARTITION BY LIST (year(current_to)) (
          PARTITION current VALUES IN (NULL),
          PARTITION historic VALUES IN (2010, 2011, 2012)
        )
      })
    end
  end

  def down
    each_resource_table(&method(:unpartition_table))
  end
end
