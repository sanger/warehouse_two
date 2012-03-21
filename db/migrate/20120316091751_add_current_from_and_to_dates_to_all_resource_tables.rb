class AddCurrentFromAndToDatesToAllResourceTables < ActiveRecord::Migration
  def up
    each_resource_table do |table|
      # We should have a date range for which the record was current.
      change_table(table, :bulk => true) do |t|
        t.column(:current_from, :datetime)
        t.column(:current_to,   :datetime)
        t.index([ :current_to, :uuid, :current_from ], :name => :current_to_and_uuid_and_current_from_idx)
      end

      # In all cases the current_from is now and the current_to is set only for those rows
      # that are not current.
      model, now = table.classify.constantize, Time.now
      model.reset_column_information
      model.update_all("current_to=#{Time.now.to_s(:db).inspect}", [ 'is_current=?', false ])
      model.update_all("current_from=#{Time.now.to_s(:db).inspect}")

      # Finally, change the current_from column so that it cannot be null
      change_column(table, :current_from, :datetime, :null => false)
    end
  end

  def down
    each_resource_table do |table|
      change_table(table, :bulk => true) do |t|
        t.remove(:current_from)
        t.remove(:current_to)
      end
    end
  end

  def each_resource_table(&block)
    connection.tables.each do |table|
      next if [ 'asset_freezers' ].include?(table)
      yield(table) if connection.columns(table).any? { |c| c.name.to_s == 'is_current' }
    end
  end
  private :each_resource_table
end
