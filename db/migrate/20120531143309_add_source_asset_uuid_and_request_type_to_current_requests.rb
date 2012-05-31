class AddSourceAssetUuidAndRequestTypeToCurrentRequests < ActiveRecord::Migration
  def change
    change_table(:current_requests) do |t|
      t.index([:source_asset_uuid, :request_type], :name => :source_asset_uuid_and_request_type_idx)
    end
  end
end
