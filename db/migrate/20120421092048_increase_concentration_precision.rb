class IncreaseConcentrationPrecision < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    migrate_to(10)
  end

  def down
    migrate_to(5)
  end

  def migrate_to(precision)
    each_resource_table do |table|
      next unless table =~ /tube/ or table == 'wells'
      change_column(table, :concentration, :decimal, :precision => precision, :scale => 2)
    end
  end
  private :migrate_to
end
