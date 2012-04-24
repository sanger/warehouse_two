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

  def change_resource_table(name, options = {}, &block)
    change_table(name, options, &block)
    change_table("current_#{name}", options, &block)
  end
  private :change_resource_table
end
