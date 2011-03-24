class AddPlatePurposeToPlates < ActiveRecord::Migration
  def self.up
    add_column :plates, :plate_purpose_name, :string
    add_column :plates, :plate_purpose_internal_id, :integer
    add_column :plates, :plate_purpose_uuid, :string, :limit => 36
    
    add_index :plates, :plate_purpose_name
    add_index :plates, :plate_purpose_internal_id
    add_index :plates, :plate_purpose_uuid
  end

  def self.down
    remove_column :plates, :plate_purpose_uuid
    remove_column :plates, :plate_purpose_internal_id
    remove_column :plates, :plate_purpose_name
  end
end