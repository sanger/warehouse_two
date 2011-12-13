class AddSubmissionToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :submission_uuid, :string, :limit => 36
    add_column :requests, :submission_internal_id, :integer

    add_index :requests, :submission_uuid
  end

  def self.down
    remove_index :requests, :column => :submission_uuid

    remove_column :requests, :submission_internal_id
    remove_column :requests, :submission_uuid
  end
end
