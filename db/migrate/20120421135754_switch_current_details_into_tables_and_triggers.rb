class SwitchCurrentDetailsIntoTablesAndTriggers < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |table|
      current_table = "current_#{table}"

      drop_view(current_table)
      execute("CREATE TABLE #{current_table} LIKE #{table}")

      # After any rows are inserted into the main table we need to check whether they are a current
      # row, or a deletion.  If neither then we are uninterested in them, otherwise we will delete
      # the existing row from the current table and, on a new current row, insert the new values.
      # Hence, the current table only ever holds rows that are current.
      after_trigger(
        %Q{
          BEGIN
            IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN
              DELETE FROM #{current_table} WHERE uuid=NEW.uuid;
            END ; END IF ;
            IF NEW.current_to IS NULL THEN BEGIN
              INSERT INTO #{current_table} (SELECT * FROM #{table} WHERE uuid=NEW.uuid AND current_from=NEW.current_from AND current_to IS NULL);
            END ; END IF ;
          END
        },
        :name  => "maintain_#{current_table}_trigger",
        :event => :insert,
        :on    => table
      )
    end
  end

  def down
    each_resource_table do |table|
      drop_trigger("maintain_current_#{table}_trigger")
      drop_table("current_#{table}")
      create_view("current_#{table}", "SELECT * FROM #{table} WHERE current_to IS NULL")
    end
  end
end

