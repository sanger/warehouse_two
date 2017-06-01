class AddS3EmailListAndDataDeletionPeriodToStudy < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.string(:s3_email_list, :null => true, :default => nil)
      t.string(:data_deletion_period, :null => true, :default => nil)
    end
  end
end
