class AddSubmissionSsModel < ActiveRecord::Migration
  def self.up
    create_table :submissions,  :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
      
      t.string :created_by
      t.string :template_name
      t.string :state
      t.string :study_name
      t.string :study_uuid, :limit => 36
      t.string :project_name
      t.string :project_uuid, :limit => 36
      t.string :message
      t.string :comments
      t.datetime :inserted_at
      t.integer :read_length
      t.string :fragment_size_required_from
      t.string :fragment_size_required_to
      t.string :library_type
      t.string :sequencing_type
      t.integer :insert_size
      t.integer :number_of_lanes

    end
    
    add_index :submissions, :uuid
    add_index :submissions, :internal_id
    add_index :submissions, :last_updated
    add_index :submissions, :created
    add_index :submissions, :project_uuid
    add_index :submissions, :study_uuid
 
  end

  def self.down
    drop_table :table_name
  end
end