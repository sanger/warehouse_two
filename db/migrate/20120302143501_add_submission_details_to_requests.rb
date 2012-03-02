class AddSubmissionDetailsToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :submission_uuid, :binary, :limit => 16
    add_column :requests, :submission_internal_id, :integer
    add_index :requests, [ :submission_uuid, :is_current ], :name => 'submission_uuid_and_is_current_idx'
  end

  def self.down
    remove_column :requests, :submission_uuid
    remove_column :requests, :submission_internal_id
  end
end
