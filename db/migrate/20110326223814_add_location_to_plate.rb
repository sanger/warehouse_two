class AddLocationToPlate < ActiveRecord::Migration
  def self.up
    add_column :plates, :location, :string
  end

  def self.down
    remove_column :plates, :location
  end
end