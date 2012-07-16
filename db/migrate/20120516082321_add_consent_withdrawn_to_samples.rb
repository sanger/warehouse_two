class AddConsentWithdrawnToSamples < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:samples) do |t|
      t.column(:consent_withdrawn, :boolean, :null => false, :default => false)
    end
  end
end
