class DropPulldownMultiplexedLibraryTubesTable < ActiveRecord::Migration
  include UuidViewHelper

  def up
    drop_view :current_pulldown_multiplexed_library_tubes
    drop_table :pulldown_multiplexed_library_tubes

    drop_view :uuid_objects
    rebuild_uuid_view
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Cannot recreate the pulldown multiplexed library tubes table"
  end
end
