class ExpandLibraryTubeVolumeColumn < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    change_resource_table(:library_tubes, :bulk => true) do |t|
      t.change(:volume,        :decimal, :scale => 2, :precision => 10)
      t.change(:concentration, :decimal, :scale => 2, :precision => 18)
    end
  end

  def down
    # Nothing really needs to happen here.
  end
end
