class AddSourceAssetDetailsToAssetAudits < ActiveRecord::Migration
  def self.up
    add_column :asset_audits, :asset_barcode, :string
    add_column :asset_audits, :asset_barcode_prefix, :string
    add_column :asset_audits, :asset_uuid, :string, :limit => 36
    
    add_index :asset_audits, :asset_uuid
    add_index :asset_audits, :asset_barcode
  end

  def self.down
    remove_column :asset_audits, :asset_uuid
    remove_column :asset_audits, :asset_barcode_prefix
    remove_column :asset_audits, :asset_barcode
  end
end