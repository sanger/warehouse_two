class ExpandCommentsOnOrders < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    change_resource_table(:orders) do |t|
      t.change(:comments, :text)
    end
  end

  def down
    # Nothing to do here really
  end
end
