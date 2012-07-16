class DropRedundantIndexFromSubmissions < ActiveRecord::Migration
  def self.up
    remove_index :submissions, :name => :study_uuid_and_is_current_and_project_uuid_idx
  end

  def self.down
    # Does nothing
  end
end
