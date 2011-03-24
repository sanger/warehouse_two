class AddPulldownMultiplexedLibraryTubeSsModel < ActiveRecord::Migration
  def self.up
    create_table :pulldown_multiplexed_library_tubes,  :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name                    
      t.string    :barcode                 
      t.string    :barcode_prefix,    :limit => 2     
      t.string    :state,             :limit => 50                   
      t.boolean   :closed                  
      t.decimal   :concentration ,   :precision => 5, :scale => 2          
      t.decimal   :volume,           :precision => 5, :scale => 2                  
      t.string    :two_dimensional_barcode 
      t.datetime  :scanned_in_date         
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
    
    add_index :pulldown_multiplexed_library_tubes, :uuid
    add_index :pulldown_multiplexed_library_tubes, :internal_id
    add_index :pulldown_multiplexed_library_tubes, :last_updated
    add_index :pulldown_multiplexed_library_tubes, :created
 
  end

  def self.down
    drop_table :table_name
  end
end