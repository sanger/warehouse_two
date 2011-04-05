class AddInsertedAtColumns < ActiveRecord::Migration
  def self.up
    add_column :asset_audits                           , :inserted_at, :datetime
    add_column :asset_freezers                         , :inserted_at, :datetime
    add_column :asset_links                            , :inserted_at, :datetime
    add_column :batch_requests                         , :inserted_at, :datetime
    add_column :batches                                , :inserted_at, :datetime
    add_column :billing_events                         , :inserted_at, :datetime
    add_column :events                                 , :inserted_at, :datetime
    add_column :lane_allocation                        , :inserted_at, :datetime
    add_column :lanes                                  , :inserted_at, :datetime
    add_column :library_tubes                          , :inserted_at, :datetime
    add_column :multiplexed_library_tubes              , :inserted_at, :datetime
    add_column :plate_purposes                         , :inserted_at, :datetime
    add_column :plates                                 , :inserted_at, :datetime
    add_column :projects                               , :inserted_at, :datetime
    add_column :pulldown_multiplexed_library_tubes     , :inserted_at, :datetime
    add_column :quotas                                 , :inserted_at, :datetime
    add_column :requests                               , :inserted_at, :datetime
    add_column :sample_tubes                           , :inserted_at, :datetime
    add_column :samples                                , :inserted_at, :datetime
    add_column :studies                                , :inserted_at, :datetime
    add_column :study_samples                          , :inserted_at, :datetime
    add_column :tag_instances                          , :inserted_at, :datetime
    add_column :tags                                   , :inserted_at, :datetime
    add_column :wells                                  , :inserted_at, :datetime
    
    add_index :plate_purposes , :inserted_at
    add_index :plates         , :inserted_at
    add_index :requests       , :inserted_at
    add_index :samples        , :inserted_at
    add_index :wells          , :inserted_at
    
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
