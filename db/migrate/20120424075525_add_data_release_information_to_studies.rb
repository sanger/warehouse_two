class AddDataReleaseInformationToStudies < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies, :bulk => true) do |t|
      t.column(:data_release_timing, :string)
      t.column(:data_release_delay_period, :string)
      t.column(:data_release_delay_reason, :string)
    end
  end
end
