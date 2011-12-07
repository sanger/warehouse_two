class AlterSampleTubesConcentrationColumn < ActiveRecord::Migration
  def self.up
    change_column :sample_tubes, :concentration, :decimal, :precision => 10, :scale =>2
  end

  def self.down
    change_column :sample_tubes, :concentration, :decimal, :precision => 5, :scale =>2
  end
end
