class AddDonorIdToSample < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:samples) do |t|
      t.string(:donor_id, :null => true, :default => nil)
    end
  end
end
