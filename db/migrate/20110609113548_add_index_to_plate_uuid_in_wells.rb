class AddIndexToPlateUuidInWells < ActiveRecord::Migration
  def self.up
    add_index :wells, :plate_uuid
  end

  def self.down
    remove_index :wells, :plate_uuid
  end
end