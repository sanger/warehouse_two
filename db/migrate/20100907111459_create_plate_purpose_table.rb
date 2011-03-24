class CreatePlatePurposeTable < ActiveRecord::Migration
  def self.up
    create_table :plate_purposes, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end

    add_index :plate_purposes, :uuid
    add_index :plate_purposes, :internal_id
    add_index :plate_purposes, :name
    add_index :plate_purposes, :is_current
    add_index :plate_purposes, :checked_at
    add_index :plate_purposes, :last_updated
    add_index :plate_purposes, :created
  end

  def self.down
  end
end
