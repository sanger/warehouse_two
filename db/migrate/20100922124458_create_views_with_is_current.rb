class CreateViewsWithIsCurrent < ActiveRecord::Migration

   @table_names = %w[asset_freezers batch_requests batches billing_events events lanes library_tubes multiplexed_library_tubes 
      plate_purposes plates projects quotas requests sample_tubes samples studies study_samples tag_instances tags wells]
  def self.up
    @table_names.each do |table_name|
      execute("create view current_#{table_name} as select * from #{table_name} where is_current=1;")
    end    
  end

  def self.down
    @table_names.each do |table_name|
      execute("drop view current_#{table_name};")
    end
  end
end
