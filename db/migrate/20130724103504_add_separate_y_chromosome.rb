class AddSeparateYChromosome < ActiveRecord::Migration
  def change
    change_resource_table(:studies) do |t|
      t.boolean(:seperate_y_chromosome_data, :null => false, :default => false)
    end
  end
end
