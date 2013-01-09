class RemoveNullAssetLinks < ActiveRecord::Migration
  def up
    ActiveRecord::Base.transaction do
      connection.update('DELETE FROM asset_links WHERE ancestor_internal_id IS NULL OR descendant_internal_id IS NULL')
      connection.update('DELETE FROM current_asset_links WHERE ancestor_internal_id IS NULL OR descendant_internal_id IS NULL')
    end
  end

  def down
    # Nothing to do here
  end
end
