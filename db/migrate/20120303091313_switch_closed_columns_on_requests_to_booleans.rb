class SwitchClosedColumnsOnRequestsToBooleans < ActiveRecord::Migration
  def self.up
    alter_table :requests do |table|
      table.rename_column :source_asset_closed, :source_asset_closed, :boolean
      table.rename_column :target_asset_closed, :target_asset_closed, :boolean
    end
  end

  def self.down
    alter_table :requests do |table|
      table.rename_column :source_asset_closed, :source_asset_closed, :string
      table.rename_column :target_asset_closed, :target_asset_closed, :string
    end
  end
end
