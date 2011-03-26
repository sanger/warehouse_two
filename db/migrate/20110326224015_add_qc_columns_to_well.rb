class AddQcColumnsToWell < ActiveRecord::Migration
  def self.up
    add_column :wells, :measured_volume, :decimal, :precision => 5, :scale => 2
    add_column :wells, :sequenom_count, :integer
    add_column :wells, :gender_markers, :string, :limit => 8
  end

  def self.down
    remove_column :wells, :gender_markers
    remove_column :wells, :sequenom_count
    remove_column :wells, :measured_volume
  end
end