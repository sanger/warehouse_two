class TightenColumnDefinitions < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      next if table == 'asset_links'

      [ table, "current_#{table}" ].each do |name|
        change_table(name, :bulk => true) do |t|
          t.change(:internal_id, :integer, :null => false)
          t.change(:is_current, :boolean, :null => false)
          t.change(:checked_at, :datetime, :null => false)
        end
      end
    end
  end

  def down
    # Nothing to do here
  end
end
