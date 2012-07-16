class AddLibraryUuidIndexToAliquots < ActiveRecord::Migration
  def change
    change_table(:current_aliquots) do |t|
      t.index([:library_uuid, :receptacle_type], :name => :library_uuid_and_receptacle_type_idx)
    end
  end
end
