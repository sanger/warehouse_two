class AddSourceAssetIndexToRequests < ActiveRecord::Migration
  def change
    change_table(:current_requests) do |t|
      t.index([:source_asset_internal_id, :target_asset_internal_id, :source_asset_type], :name => :assets_via_internal_id_from_source_idx)
    end
  end
end
