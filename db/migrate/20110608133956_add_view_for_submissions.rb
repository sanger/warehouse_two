class AddViewForSubmissions < ActiveRecord::Migration
  def self.up
    table_names = %w[submissions asset_links]
    table_names.each do |table_name|
      execute("create view current_#{table_name} as select * from #{table_name} where is_current=1;")
    end
  end

  def self.down
  end
end
