class AddBaitInformationToBillingEvents < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:billing_events) do |t|
      t.string(:bait_library_type)
    end
  end
end
