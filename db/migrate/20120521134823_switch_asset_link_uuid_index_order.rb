class SwitchAssetLinkUuidIndexOrder < ActiveRecord::Migration
  def up
    change_table(:current_asset_links, :bulk => true) do |t|
      t.index([ :descendant_uuid, :ancestor_uuid ], :name => :descendant_uuid_ancestor_uuid_idx)
      t.remove_index(:name => :ancestor_uuid_descendant_uuid_idx)
    end
  end

  def down
    change_table(:current_asset_links, :bulk => true) do |t|
      t.index([ :ancestor_uuid, :descendant_uuid ], :name => :ancestor_uuid_descendant_uuid_idx)
      t.remove_index(:name => :descendant_uuid_ancestor_uuid_idx)
    end
  end
end
