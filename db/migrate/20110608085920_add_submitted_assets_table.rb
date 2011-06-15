class AddSubmittedAssetsTable < ActiveRecord::Migration
  def self.up
    create_table :submitted_assets, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer :dont_use_id
      t.string :submission_uuid
      t.string :asset_uuid
    end
    
    add_index :submitted_assets, :submission_uuid
    add_index :submitted_assets, :asset_uuid
  end

  def self.down
    drop_table :submitted_assets
  end
end
