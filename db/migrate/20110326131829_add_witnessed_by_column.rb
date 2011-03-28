class AddWitnessedByColumn < ActiveRecord::Migration
  def self.up
    add_column :asset_audits, :witnessed_by, :string
  end

  def self.down
    remove_column :asset_audits, :witnessed_by
  end
end