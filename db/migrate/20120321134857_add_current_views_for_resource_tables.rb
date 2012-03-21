class AddCurrentViewsForResourceTables < ActiveRecord::Migration
  def up
    each_resource_table do |name|
      create_view(:"current_#{name}", "SELECT * FROM #{name} WHERE current_to IS NULL")
    end
  end

  def down
    each_resource_table do |name|
      drop_view(:"current_#{name}")
    end
  end

  def each_resource_table(&block)
    connection.tables.each do |table|
      next if [ 'asset_freezers' ].include?(table) or table =~ /^current_.+$/
      yield(table) if connection.columns(table).any? { |c| c.name.to_s == 'is_current' }
    end
  end
  private :each_resource_table
end
