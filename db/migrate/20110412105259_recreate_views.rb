class RecreateViews < ActiveRecord::Migration
  def self.up
    table_names = %w[asset_freezers batch_requests batches billing_events events lanes library_tubes multiplexed_library_tubes 
        plate_purposes plates projects quotas requests sample_tubes samples studies study_samples tag_instances tags wells asset_audits pulldown_multiplexed_library_tubes]
    table_names.each do |table_name|
      execute("drop view current_#{table_name};")
      execute("create view current_#{table_name} as select * from #{table_name} where is_current=1;")
    end
  end

  def self.down
  end
end
