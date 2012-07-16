class RebuildUuidObjectsOnCurrentTables < ActiveRecord::Migration
  include UuidViewHelper

  def up
    drop_view('uuid_objects')
    rebuild_uuid_view
  end

  def down
    # Nothing to do here
  end
end
