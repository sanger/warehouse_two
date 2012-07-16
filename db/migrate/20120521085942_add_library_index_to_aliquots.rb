class AddLibraryIndexToAliquots < ActiveRecord::Migration
  def change
    change_table(:current_aliquots) do |t|
      t.index([ :library_internal_id, :study_internal_id ], :name => :library_internal_id_study_internal_id_idx)
    end
  end
end
