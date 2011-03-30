class AddSampleDataReleaseColumns < ActiveRecord::Migration
  def self.up
    add_column :samples, :public_name, :string
    add_column :samples, :sample_visibility, :string
    add_column :samples, :strain, :string
  end

  def self.down
    remove_column :samples, :strain
    remove_column :samples, :sample_visibility
    remove_column :samples, :public_name
  end
end