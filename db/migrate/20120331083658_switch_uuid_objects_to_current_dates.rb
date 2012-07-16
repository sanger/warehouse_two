class SwitchUuidObjectsToCurrentDates < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    selects = []
    each_resource_table do |table|
      columns = [ :uuid, 'HEX(uuid) AS decoded_uuid', :checked_at, :last_updated, :created ]
      columns << (has_column?(table, :deleted_at)  ? :deleted_at  : 'NULL AS deleted_at')
      columns << (has_column?(table, :name)        ? :name        : 'NULL AS name')
      columns << (has_column?(table, :internal_id) ? :internal_id : 'NULL AS internal_id')
      columns << "#{table.to_s.inspect} AS object_name"
      selects << "SELECT #{columns.join(',')} FROM #{table} WHERE current_to IS NULL AND uuid IS NOT NULL"
    end

    drop_view :uuid_objects
    create_view :uuid_objects, "(#{selects.join(') UNION (')})"
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "Cannot remove this view!"
  end
end
