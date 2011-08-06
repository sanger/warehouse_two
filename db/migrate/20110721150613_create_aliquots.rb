class CreateAliquots < ActiveRecord::Migration
  def self.up
    create_table :aliquots, :force => true, :primary_key => :dont_use_id do |t|
      # standard columns
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id

      #specific columns
      %w{receptacle study project library sample tag}.each do |model|
        t.string "#{model}_uuid", :limit => 36
        t.integer "#{model}_internal_id"
      end
      

      t.string :receptacle_type
      t.string :library_type

      t.integer :insert_size_from
      t.integer :insert_size_to

      # standard
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
      t.timestamp :inserted_at
    end

    add_index :aliquots, :uuid
    add_index :aliquots, :internal_id
    add_index :aliquots, :last_updated
    add_index :aliquots, :created
 
  end

  def self.down
    drop_table :aliquots
  end
end
