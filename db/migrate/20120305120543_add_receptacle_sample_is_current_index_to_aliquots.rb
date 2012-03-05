class AddReceptacleSampleIsCurrentIndexToAliquots < ActiveRecord::Migration
  def self.up
    add_index :aliquots, [ :receptacle_uuid, :sample_uuid, :is_current ], :name => 'receptacle_uuid_and_sample_uuid_and_is_current_idx'
  end

  def self.down
    drop_index :aliquots, :name => 'receptacle_uuid_and_sample_uuid_and_is_current_idx'
  end
end
