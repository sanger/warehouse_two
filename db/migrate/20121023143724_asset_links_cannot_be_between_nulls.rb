class AssetLinksCannotBeBetweenNulls < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    switch(:null => false)
  end

  def down
    switch({})
  end

  def switch(options)
    change_resource_table(:asset_links, :bulk => true) do |t|
      t.change(:ancestor_internal_id,   :integer, options)
      t.change(:descendant_internal_id, :integer, options)
    end
  end
  private :switch
end
