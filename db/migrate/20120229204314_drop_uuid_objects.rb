class DropUuidObjects < ActiveRecord::Migration
  def self.up
    drop_table :uuid_objects
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't undo this!"
  end
end
