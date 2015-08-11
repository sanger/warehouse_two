class AddPrelimIdToStudy < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration
  def change
    change_resource_table(:studies) do |t|
      t.string   'prelim_id',    limit: 5,  comment: 'Prelim Id'
    end
  end
end
