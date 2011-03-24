class RemoveSomeIndices < ActiveRecord::Migration
  def self.up
    remove_index :asset_links, :name => :index_asset_links_on_ancestor_type
    remove_index :asset_links, :name => :index_asset_links_on_descendant_type
    remove_index :asset_links, :name => :index_asset_links_on_is_current
    remove_index :asset_links, :name => :index_asset_links_on_last_updated
    remove_index :asset_links, :name => :index_asset_links_on_created

    remove_index :batch_requests, :name => :index_batch_requests_on_request_type
    remove_index :batches, :name => :index_batches_on_assigned_to
    remove_index :batches, :name => :index_batches_on_pipeline_name
    remove_index :batches, :name => :index_batches_on_production_state
    remove_index :events, :name => :index_events_on_descriptor_key
    remove_index :events, :name => :index_events_on_of_interest_to
    remove_index :events, :name => :index_events_on_created_by
    remove_index :events, :name => :index_events_on_source_type
    remove_index :events, :name => :index_events_on_actioned
    remove_index :events, :name => :index_events_on_location
    remove_index :lanes, :name => :index_lanes_on_barcode_prefix
    remove_index :lanes, :name => :index_lanes_on_two_dimensional_barcode
    remove_index :lanes, :name => :index_lanes_on_scanned_in_date
    remove_index :lanes, :name => :index_lanes_on_closed
    remove_index :library_tubes, :name => :index_library_tubes_on_barcode_prefix
    remove_index :library_tubes, :name => :index_library_tubes_on_closed
    remove_index :library_tubes, :name => :index_library_tubes_on_two_dimensional_barcode
    remove_index :library_tubes, :name => :index_library_tubes_on_volume
    remove_index :library_tubes, :name => :index_library_tubes_on_concentration
    remove_index :library_tubes, :name => :index_library_tubes_on_expected_sequence
    remove_index :library_tubes, :name => :index_library_tubes_on_tag_group_name
    remove_index :multiplexed_library_tubes, :name => :index_multiplexed_library_tubes_on_barcode_prefix
    remove_index :multiplexed_library_tubes, :name => :index_multiplexed_library_tubes_on_closed
    remove_index :multiplexed_library_tubes, :name => :index_multiplexed_library_tubes_on_concentration
    remove_index :multiplexed_library_tubes, :name => :index_multiplexed_library_tubes_on_name
    remove_index :multiplexed_library_tubes, :name => :index_multiplexed_library_tubes_on_two_dimensional_barcode
    remove_index :multiplexed_library_tubes, :name => :index_multiplexed_library_tubes_on_volume
    remove_index :plates, :name => :index_plates_on_plate_size
    remove_index :plates, :name => :index_plates_on_plate_purpose_name
    remove_index :quotas, :name => :index_quotas_on_project_name
    remove_index :requests, :name => :study_id_is_current
    remove_index :requests, :name => :index_requests_on_source_asset_barcode_prefix
    remove_index :requests, :name => :index_requests_on_source_asset_closed
    remove_index :requests, :name => :index_requests_on_source_asset_name
    remove_index :requests, :name => :index_requests_on_source_asset_two_dimensional_barcode
    remove_index :requests, :name => :index_requests_on_target_asset_barcode_prefix
    remove_index :requests, :name => :index_requests_on_target_asset_closed
    remove_index :requests, :name => :index_requests_on_target_asset_name
    remove_index :requests, :name => :index_requests_on_target_asset_two_dimensional_barcode
    remove_index :requests, :name => :index_requests_on_fragment_size_from
    remove_index :requests, :name => :index_requests_on_fragment_size_to
    remove_index :requests, :name => :index_requests_on_read_length
    remove_index :sample_tubes, :name => :index_sample_tubes_on_barcode_prefix
    remove_index :sample_tubes, :name => :index_sample_tubes_on_closed
    remove_index :sample_tubes, :name => :index_sample_tubes_on_concentration
    remove_index :sample_tubes, :name => :index_sample_tubes_on_two_dimensional_barcode
    remove_index :sample_tubes, :name => :index_sample_tubes_on_volume
    remove_index :samples, :name => :index_samples_on_control
    remove_index :samples, :name => :index_samples_on_father
    remove_index :samples, :name => :index_samples_on_mother
    remove_index :samples, :name => :index_samples_on_replicate
    remove_index :study_samples, :name => :index_study_samples_on_checked_at
    remove_index :study_samples, :name => :index_study_samples_on_created
    remove_index :study_samples, :name => :index_study_samples_on_last_updated
    remove_index :tag_instances, :name => :index_tag_instances_on_barcode_prefix
    remove_index :tag_instances, :name => :index_tag_instances_on_two_dimensional_barcode
    remove_index :uuid_objects, :name => :index_uuid_objects_on_url
    remove_index :uuid_objects, :name => :index_uuid_objects_on_object_name
    remove_index :uuid_objects, :name => :index_uuid_objects_on_checked_at
    remove_index :uuid_objects, :name => :index_uuid_objects_on_created
    remove_index :uuid_objects, :name => :index_uuid_objects_on_last_updated
    remove_index :wells, :name => :index_wells_on_buffer_volume
    remove_index :wells, :name => :index_wells_on_concentration
    remove_index :wells, :name => :index_wells_on_current_volume
    remove_index :wells, :name => :index_wells_on_gel_pass
    remove_index :wells, :name => :index_wells_on_name
    remove_index :wells, :name => :index_wells_on_picked_volume
    remove_index :wells, :name => :index_wells_on_pico_pass
    remove_index :wells, :name => :index_wells_on_requested_volume
    
  end

  def self.down
  end
end