class AddAssetAuditSsModel < ActiveRecord::Migration
  def self.up
    create_table :asset_audits,  :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :key
      t.string    :message
      t.string    :created_by
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
      
    end
    add_index :asset_audits, :created_by
    add_index :asset_audits, :key
    add_index :asset_audits, :uuid
    add_index :asset_audits, :internal_id
    add_index :asset_audits, :last_updated
    add_index :asset_audits, :created
 
  end

  def self.down
    drop_table :table_name
  end
end