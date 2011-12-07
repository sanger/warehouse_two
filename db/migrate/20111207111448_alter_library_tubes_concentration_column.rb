class AlterLibraryTubesConcentrationColumn < ActiveRecord::Migration
  def self.up
    change_column :library_tubes, :concentration, :decimal, :precision => 10, :scale =>2
  end

  def self.down
    change_column :library_tubes, :concentration, :decimal, :precision => 5, :scale =>2
  end
end
