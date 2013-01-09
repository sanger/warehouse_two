class RemoveUnnecessaryIndicesFromAliquots < ActiveRecord::Migration
  def up
    change_table(:aliquots) do |t|
      t.remove_index(:name => 'index_aliquots_on_library_internal_id')
      t.remove_index(:name => 'index_aliquots_on_library_uuid')
      t.remove_index(:name => 'index_aliquots_on_receptacle_internal_id')
      t.remove_index(:name => 'index_aliquots_on_receptacle_uuid')
      t.remove_index(:name => 'index_aliquots_on_sample_internal_id')
      t.remove_index(:name => 'index_aliquots_on_sample_uuid')
    end
  end

  def down
    # Do nothing, they should not have been here in the first place
  end
end
