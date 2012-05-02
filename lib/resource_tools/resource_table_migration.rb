module ResourceTools::ResourceTableMigration
  def each_resource_table(&block)
    connection.tables.each do |table|
      next if table =~ /^current_/ or [ 'asset_freezers' ].include?(table)
      yield(table) if ['current_from','current_to'].all? { |c| has_column?(table, c) }
    end
  end
  private :each_resource_table

  def has_column?(table, column)
    connection.columns(table).any? { |c| column.to_s == c.name.to_s }
  end
  private :has_column?

  # Ensures that changes to the normal tables affect the current ones too, as well as ensuring that the
  # triggers remain in step too.
  def change_resource_table(name, options = {}, &block)
    change_table(name, options, &block)
    change_table("current_#{name}", options, &block)
    maintain_currency_triggers(name)
  end
  private :change_resource_table

  # Ensures that the triggers that maintain the current tables are instep with the table definition.
  #
  # The trigger created is intended to insert all new values into the current table.  Originally this
  # did a query back into the normal table, but that caused deadlocks, so here we automatically
  # generate the column names.  Because this is called from change_resource_table we are ensured that
  # modifications to the resource tables will maintain the trigger appropriately.
  def maintain_currency_triggers(table)
    current_table = "current_#{table}"
    columns = connection.columns(current_table).map(&:name)

    quoted_columns = columns.map { |n| quote_table_name(n) }.join(',')
    new_values     = columns.map { |n| "NEW.#{n}" }.join(',')

    drop_trigger("maintain_current_#{table}_trigger")
    after_trigger(
      %Q{
        BEGIN
          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN
            DELETE FROM #{current_table} WHERE uuid=NEW.uuid;
          END ; END IF ;
          IF NEW.current_to IS NULL THEN BEGIN
            INSERT INTO #{current_table}(#{quoted_columns}) VALUES(#{new_values});
          END ; END IF ;
        END
      },
      :name  => "maintain_#{current_table}_trigger",
      :event => :insert,
      :on    => table
    )
  end
  private :maintain_currency_triggers
end
