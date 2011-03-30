class AddGenotypingStatusColumnsToWell < ActiveRecord::Migration
  def self.up
    add_column :wells, :genotyping_status, :string
    add_column :wells, :genotyping_snp_plate_id, :string
  end

  def self.down
    remove_column :wells, :genotyping_snp_plate_id
    remove_column :wells, :genotyping_status
  end
end