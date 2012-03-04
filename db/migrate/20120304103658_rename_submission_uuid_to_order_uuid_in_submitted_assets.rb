class RenameSubmissionUuidToOrderUuidInSubmittedAssets < ActiveRecord::Migration
  def self.up
    rename_column :submitted_assets, :submission_uuid, :order_uuid
  end

  def self.down
    rename_column :submitted_assets, :order_uuid, :submission_uuid
  end
end
