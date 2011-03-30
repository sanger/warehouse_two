class AddDeletedColumnToUuidObjects < ActiveRecord::Migration
  def self.up
    add_column :uuid_objects, :deleted, :boolean
    remove_column :uuid_objects, :url
  end

  def self.down
    remove_column :uuid_objects, :deleted
  end
end