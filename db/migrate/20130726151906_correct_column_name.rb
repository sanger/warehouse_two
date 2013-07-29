class CorrectColumnName < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def change
    change_resource_table(:studies) do |t|
      t.rename(:seperate_y_chromosome_data, :separate_y_chromosome_data)
    end
  end
end
