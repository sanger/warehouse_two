class RegenerateCurrentViewsAfterPartitioning < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up   ; recreate_views ; end
  def down ; recreate_views ; end

  def recreate_views
    each_resource_table do |name|
      drop_view(:"current_#{name}")
      create_view(:"current_#{name}", "SELECT * FROM #{name} WHERE current_to IS NULL")
    end
  end
  private :recreate_views
end
