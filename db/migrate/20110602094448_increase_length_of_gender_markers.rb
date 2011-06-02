class IncreaseLengthOfGenderMarkers < ActiveRecord::Migration
  def self.up
    change_column :wells, :gender_markers, :string, :limit => 40
  end

  def self.down
    change_column :wells, :gender_markers, :string, :limit => 8
  end
end