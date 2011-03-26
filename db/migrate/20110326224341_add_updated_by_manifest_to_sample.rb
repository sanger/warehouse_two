class AddUpdatedByManifestToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :updated_by_manifest, :boolean
  end

  def self.down
    remove_column :samples, :updated_by_manifest
  end
end