class RemoveUuidObjectsView < ActiveRecord::Migration

  include UuidViewHelper

  def up
    drop_view :uuid_objects
  end

  def down
    rebuild_uuid_view
  end
end
