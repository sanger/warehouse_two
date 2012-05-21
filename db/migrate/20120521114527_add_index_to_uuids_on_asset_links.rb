class AddIndexToUuidsOnAssetLinks < ActiveRecord::Migration
  def change
    change_table(:current_asset_links) do |t|
      t.index([:ancestor_uuid, :descendant_uuid], :name => :ancestor_uuid_descendant_uuid_idx)
    end
  end
end
