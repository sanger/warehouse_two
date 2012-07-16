class SwitchCurrentFromIndexColumnOrder < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    switch_index(:uuid, :current_from, :current_to)
  end

  def down
    switch_index(:current_from, :uuid, :current_to)
  end

  def switch_index(first, second, third)
    each_resource_table do |table|
      change_table(table, :bulk => true) do |t|
        t.remove_index(:name => :"#{second}_and_#{first}_and_#{third}_idx")
        t.index([first, second, third], :name => :"#{first}_and_#{second}_and_#{third}_idx")
      end
    end
  end
  private :switch_index
end
