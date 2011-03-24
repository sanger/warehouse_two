class AddSangerSampleId < ActiveRecord::Migration
  def self.up
    add_column :samples, :sanger_sample_id, :string
    add_index :samples, :sanger_sample_id
  end

  def self.down
    remove_column :samples, :sanger_sample_id
  end
end