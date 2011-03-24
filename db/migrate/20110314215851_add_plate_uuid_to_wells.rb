class AddPlateUuidToWells < ActiveRecord::Migration
  def self.up
    add_column :wells, :plate_uuid, :string, :limit => 36
  end

  def self.down
    remove_column :wells, :plate_uuid
  end
end