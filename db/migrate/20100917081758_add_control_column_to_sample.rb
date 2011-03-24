class AddControlColumnToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :control, :boolean
    add_index :samples, :control
  end

  def self.down
    remove_column :samples, :control
  end
end