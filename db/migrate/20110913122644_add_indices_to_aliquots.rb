class AddIndicesToAliquots < ActiveRecord::Migration
  def self.up
    add_index :aliquots, :receptacle_uuid
    add_index :aliquots, :receptacle_internal_id
    add_index :aliquots, :library_internal_id
    add_index :aliquots, :library_uuid
    add_index :aliquots, :sample_uuid
    add_index :aliquots, :sample_internal_id
  end

  def self.down
    remove_index :aliquots, :receptacle_uuid
    remove_index :aliquots, :receptacle_internal_id
    remove_index :aliquots, :library_internal_id
    remove_index :aliquots, :library_uuid
    remove_index :aliquots, :sample_uuid
    remove_index :aliquots, :sample_internal_id
  end
end
