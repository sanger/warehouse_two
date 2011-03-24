class Add<%= singular_name.camelize %>SsModel < ActiveRecord::Migration
  def self.up
    create_table :<%= plural_name %>,  :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
      
      # Add custom column here
    end
    
    add_index :<%= plural_name %>, :uuid
    add_index :<%= plural_name %>, :internal_id
    add_index :<%= plural_name %>, :last_updated
    add_index :<%= plural_name %>, :created
 
  end

  def self.down
    drop_table :table_name
  end
end