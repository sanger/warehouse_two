class CreateIndexTable < ActiveRecord::Migration
  def self.up
    self.create_events_table
    self.create_events_indices

    self.create_asset_links_table
    self.create_asset_links_indices
    self.create_uuid_objects_table
    self.create_uuid_objects_indices
    self.create_studies_table
    self.create_studies_indices

    self.create_samples_table
    self.create_samples_indices
    self.create_projects_table
    self.create_projects_indices

    self.create_library_tubes_table
    self.create_library_tubes_indices

    self.create_lanes_table
    self.create_lanes_indices

    self.create_multiplexed_library_tubes_table
    self.create_multiplexed_library_tubes_indices

    self.create_plates_table
    self.create_plates_indices

    self.create_wells_table
    self.create_wells_indices

    self.create_sample_tubes_table
    self.create_sample_tubes_indices

    self.create_requests_table
    self.create_requests_indices

    self.create_batches_table
    self.create_batches_indices

    self.create_batch_requests_table
    self.create_batch_requests_indices

    self.create_study_samples_table
    self.create_study_samples_indices

    self.create_tags_table
    self.create_tags_indices

    self.create_tag_instances_table
    self.create_tag_instances_indices

    self.create_asset_freezers_table
    self.create_asset_freezers_indices

    self.create_quotas_table
    self.create_quotas_indices

    self.create_billing_events_table
    self.create_billing_events_indices
  end

  def self.create_billing_events_table
    create_table :billing_events, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :reference
      t.integer   :project_internal_id
      t.string    :project_uuid, :limit => 36
      t.string    :project_name
      t.string    :division
      t.string    :created_by
      t.integer   :request_internal_id
      t.string    :request_uuid, :limit => 36
      t.string    :request_type
      t.string    :library_type
      t.string    :cost_code
      t.integer   :price
      t.integer   :quantity
      t.string    :kind
      t.string    :description
      t.boolean   :is_current
      t.timestamp :entry_date
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_billing_events_indices
    add_index :billing_events, :uuid
    add_index :billing_events, :internal_id
    add_index :billing_events, :reference
    add_index :billing_events, :project_internal_id
    add_index :billing_events, :project_uuid
    add_index :billing_events, :project_name
    add_index :billing_events, :division
    add_index :billing_events, :created_by
    add_index :billing_events, :request_internal_id
    add_index :billing_events, :request_uuid
    add_index :billing_events, :request_type
    add_index :billing_events, :library_type
    add_index :billing_events, :cost_code
    add_index :billing_events, :price
    add_index :billing_events, :quantity
    add_index :billing_events, :kind
    add_index :billing_events, :description
    add_index :billing_events, :is_current
    add_index :billing_events, :entry_date
    add_index :billing_events, :checked_at
    add_index :billing_events, :last_updated
    add_index :billing_events, :created
  end


  def self.create_quotas_table
    create_table :quotas, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.integer   :quota_limit
      t.string    :request_type
      t.integer   :project_internal_id
      t.string    :project_uuid, :limit => 36
      t.string    :project_name
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_quotas_indices
    add_index :quotas, :uuid
    add_index :quotas, :quota_limit
    add_index :quotas, :request_type
    add_index :quotas, :project_internal_id
    add_index :quotas, :project_uuid
    add_index :quotas, :project_name
    add_index :quotas, :internal_id
    add_index :quotas, :is_current
    add_index :quotas, :checked_at
    add_index :quotas, :last_updated
    add_index :quotas, :created
  end

  def self.create_asset_freezers_table
    create_table :asset_freezers, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :asset_type
      t.string    :barcode
      t.string    :barcode_prefix
      t.string    :building
      t.string    :room
      t.string    :freezer
      t.string    :shelf
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_asset_freezers_indices
    add_index :asset_freezers, :uuid
    add_index :asset_freezers, :internal_id
    add_index :asset_freezers, :name
    add_index :asset_freezers, :asset_type
    add_index :asset_freezers, :barcode
    add_index :asset_freezers, :barcode_prefix
    add_index :asset_freezers, :building
    add_index :asset_freezers, :room
    add_index :asset_freezers, :freezer
    add_index :asset_freezers, :shelf
    add_index :asset_freezers, :is_current
    add_index :asset_freezers, :checked_at
    add_index :asset_freezers, :last_updated
    add_index :asset_freezers, :created
  end


  def self.create_tag_instances_table
    create_table :tag_instances, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :barcode
      t.string    :barcode_prefix, :limit =>2
      t.string    :two_dimensional_barcode
      t.string    :tag_uuid, :limit => 36
      t.integer   :tag_internal_id
      t.string    :tag_expected_sequence
      t.integer   :tag_map_id
      t.string    :tag_group_name
      t.string    :tag_group_uuid, :limit => 36
      t.integer   :tag_group_internal_id
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_tag_instances_indices
    add_index :tag_instances, :uuid
    add_index :tag_instances, :internal_id
    add_index :tag_instances, :name
    add_index :tag_instances, :barcode
    add_index :tag_instances, :barcode_prefix
    add_index :tag_instances, :two_dimensional_barcode
    add_index :tag_instances, :tag_uuid
    add_index :tag_instances, :tag_internal_id
    add_index :tag_instances, :tag_expected_sequence
    add_index :tag_instances, :tag_map_id
    add_index :tag_instances, :tag_group_name
    add_index :tag_instances, :tag_group_uuid
    add_index :tag_instances, :tag_group_internal_id
    add_index :tag_instances, :checked_at
    add_index :tag_instances, :last_updated
    add_index :tag_instances, :created
    add_index :tag_instances, :is_current
  end


  def self.create_tags_table
    create_table :tags, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer  :dont_use_id
      t.string   :uuid, :limit => 36, :null => false
      t.integer  :internal_id
      t.string   :expected_sequence
      t.integer  :map_id
      t.string   :tag_group_name
      t.string   :tag_group_uuid, :limit => 36
      t.integer  :tag_group_internal_id
      t.boolean  :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_tags_indices
    add_index :tags, :uuid
    add_index :tags, :internal_id
    add_index :tags, :expected_sequence
    add_index :tags, :map_id
    add_index :tags, :tag_group_name
    add_index :tags, :tag_group_uuid
    add_index :tags, :tag_group_internal_id
    add_index :tags, :checked_at
    add_index :tags, :last_updated
    add_index :tags, :created
    add_index :tags, :is_current
  end

  def self.create_study_samples_table
    create_table :study_samples, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36
      t.integer   :internal_id
      t.integer   :sample_internal_id
      t.string    :sample_uuid, :limit => 36
      t.integer   :study_internal_id
      t.string    :study_uuid, :limit => 36
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_study_samples_indices
    add_index :study_samples, :uuid
    add_index :study_samples, :internal_id
    add_index :study_samples, :sample_internal_id
    add_index :study_samples, :sample_uuid
    add_index :study_samples, :study_internal_id
    add_index :study_samples, :study_uuid
    add_index :study_samples, :checked_at
    add_index :study_samples, :is_current
    add_index :study_samples, :last_updated
    add_index :study_samples, :created
  end

  def self.create_events_table
    create_table :events, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.integer   :source_internal_id
      t.string    :source_uuid, :limit => 36
      t.string    :source_type
      t.string    :message
      t.string    :state
      t.string    :identifier
      t.string    :location
      t.boolean   :actioned
      t.text      :content
      t.string    :created_by
      t.string    :of_interest_to
      t.string    :descriptor_key
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_events_indices
    add_index :events,  :uuid
    add_index :events,  :checked_at
    add_index :events,  :internal_id
    add_index :events,  :source_internal_id
    add_index :events,  :source_uuid
    add_index :events,  :source_type
    add_index :events,  :message
    add_index :events,  :state
    add_index :events,  :identifier
    add_index :events,  :location
    add_index :events,  :actioned
    add_index :events,  :created_by
    add_index :events,  :of_interest_to
    add_index :events,  :descriptor_key
    add_index :events,  :last_updated
    add_index :events,  :created
    add_index :events,  :checked_at
    add_index :events,  :is_current
  end

  def self.create_asset_links_table
    create_table :asset_links, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36
      t.string    :ancestor_uuid, :limit => 36
      t.integer   :ancestor_internal_id
      t.string    :ancestor_type
      t.string    :descendant_uuid, :limit => 36
      t.integer   :descendant_internal_id
      t.string    :descendant_type
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_asset_links_indices
    add_index :asset_links, :ancestor_uuid
    add_index :asset_links, :uuid
    add_index :asset_links, :ancestor_internal_id
    add_index :asset_links, :ancestor_type
    add_index :asset_links, :descendant_uuid
    add_index :asset_links, :descendant_internal_id
    add_index :asset_links, :descendant_type
    add_index :asset_links, :checked_at
    add_index :asset_links, :is_current
    add_index :asset_links, :last_updated
    add_index :asset_links, :created
  end

  def self.create_uuid_objects_table
    create_table :uuid_objects, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :object_name
      t.string    :url
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_uuid_objects_indices
    add_index :uuid_objects, :uuid, :unique => true
    add_index :uuid_objects, :internal_id
    add_index :uuid_objects, :name
    add_index :uuid_objects, :object_name
    add_index :uuid_objects, :url
    add_index :uuid_objects, :checked_at
    add_index :uuid_objects, :last_updated
    add_index :uuid_objects, :created
  end

  def self.create_studies_table
    create_table :studies, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :reference_genome
      t.boolean   :ethically_approved
      t.string    :faculty_sponsor
      t.string    :state, :limit => 50
      t.string    :study_type, :limit => 50
      t.text      :abstract
      t.string    :abbreviation
      t.string    :accession_number, :limit => 50
      t.text      :description
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end
  def self.create_studies_indices
    add_index :studies, :uuid
    add_index :studies, :internal_id
    add_index :studies, :name
    add_index :studies, :reference_genome
    add_index :studies, :ethically_approved
    add_index :studies, :faculty_sponsor
    add_index :studies, :state
    add_index :studies, :study_type
    add_index :studies, :abbreviation
    add_index :studies, :accession_number
    add_index :studies, :is_current
    add_index :studies, :checked_at
    add_index :studies, :last_updated
    add_index :studies, :created
  end

  def self.create_samples_table
    create_table :samples, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :reference_genome
      t.string    :organism
      t.string    :accession_number, :limit => 50
      t.string    :common_name
      t.text      :description
      t.string    :taxon_id
      t.string    :father
      t.string    :mother
      t.string    :replicate
      t.string    :ethnicity
      t.string    :gender, :limit => 20
      t.string    :cohort
      t.string    :country_of_origin
      t.string    :geographical_region
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end
  def self.create_samples_indices
    add_index :samples, :uuid
    add_index :samples, :internal_id
    add_index :samples, :name
    add_index :samples, :reference_genome
    add_index :samples, :organism
    add_index :samples, :accession_number
    add_index :samples, :common_name
    add_index :samples, :taxon_id
    add_index :samples, :father
    add_index :samples, :mother
    add_index :samples, :replicate
    add_index :samples, :ethnicity
    add_index :samples, :gender
    add_index :samples, :cohort
    add_index :samples, :country_of_origin
    add_index :samples, :geographical_region
    add_index :samples, :is_current
    add_index :samples, :checked_at
    add_index :samples, :last_updated
    add_index :samples, :created
  end


  def self.create_projects_table
    create_table :projects, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :collaborators
      t.text      :funding_comments
      t.string    :cost_code
      t.string    :funding_model
      t.boolean   :approved
      t.string    :budget_division
      t.string    :external_funding_source
      t.string    :project_manager
      t.string    :budget_cost_centre
      t.string    :state, :limit => 50
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_projects_indices
    add_index :projects, :uuid
    add_index :projects, :internal_id
    add_index :projects, :name
    add_index :projects, :collaborators
    add_index :projects, :cost_code
    add_index :projects, :funding_model
    add_index :projects, :approved
    add_index :projects, :budget_division
    add_index :projects, :external_funding_source
    add_index :projects, :project_manager
    add_index :projects, :budget_cost_centre
    add_index :projects, :state
    add_index :projects, :is_current
    add_index :projects, :checked_at
    add_index :projects, :last_updated
    add_index :projects, :created
  end

  def self.create_library_tubes_table
    create_table :library_tubes, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :barcode
      t.string    :barcode_prefix, :limit =>2
      t.boolean   :closed
      t.string    :state, :limit => 50
      t.string    :two_dimensional_barcode
      t.string    :sample_uuid, :limit => 36
      t.integer   :sample_internal_id
      t.decimal   :volume, :precision => 5, :scale => 2
      t.decimal   :concentration, :precision => 5, :scale => 2
      t.string    :tag_uuid, :limit => 36
      t.integer   :tag_internal_id
      t.string    :expected_sequence
      t.integer   :tag_map_id
      t.string    :tag_group_name
      t.string    :tag_group_uuid, :limit => 36
      t.integer   :tag_group_internal_id
      t.integer   :source_request_internal_id  
      t.string    :source_request_uuid, :limit => 36     
      t.string    :library_type                
      t.string    :fragment_size_required_from 
      t.string    :fragment_size_required_to   
      t.string    :sample_name
      t.boolean   :is_current
      t.timestamp :scanned_in_date
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_library_tubes_indices
    add_index :library_tubes, :uuid
    add_index :library_tubes, :internal_id
    add_index :library_tubes, :name
    add_index :library_tubes, :barcode
    add_index :library_tubes, :barcode_prefix
    add_index :library_tubes, :state
    add_index :library_tubes, :closed
    add_index :library_tubes, :two_dimensional_barcode
    add_index :library_tubes, :sample_uuid
    add_index :library_tubes, :sample_internal_id
    add_index :library_tubes, :sample_name
    add_index :library_tubes, :volume
    add_index :library_tubes, :concentration
    add_index :library_tubes, :is_current
    add_index :library_tubes, :checked_at
    add_index :library_tubes, :scanned_in_date
    add_index :library_tubes, :last_updated
    add_index :library_tubes, :created
    add_index :library_tubes, :tag_uuid
    add_index :library_tubes, :tag_internal_id
    add_index :library_tubes, :expected_sequence
    add_index :library_tubes, :tag_map_id
    add_index :library_tubes, :tag_group_name
    add_index :library_tubes, :tag_group_uuid
    add_index :library_tubes, :tag_group_internal_id
    add_index :library_tubes, :source_request_internal_id  
    add_index :library_tubes, :source_request_uuid         
    add_index :library_tubes, :library_type                
    add_index :library_tubes, :fragment_size_required_from 
    add_index :library_tubes, :fragment_size_required_to
  end

  def self.create_lanes_table
    create_table :lanes, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :barcode
      t.string    :barcode_prefix, :limit =>2
      t.boolean   :closed
      t.string    :state, :limit => 50
      t.string    :two_dimensional_barcode
      t.boolean   :external_release
      t.boolean   :is_current
      t.timestamp :scanned_in_date
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_lanes_indices
    add_index :lanes, :uuid
    add_index :lanes, :internal_id
    add_index :lanes, :name
    add_index :lanes, :barcode
    add_index :lanes, :barcode_prefix
    add_index :lanes, :state
    add_index :lanes, :closed
    add_index :lanes, :external_release
    add_index :lanes, :two_dimensional_barcode
    add_index :lanes, :is_current
    add_index :lanes, :checked_at
    add_index :lanes, :scanned_in_date
    add_index :lanes, :last_updated
    add_index :lanes, :created
  end



  def self.create_multiplexed_library_tubes_table
    create_table :multiplexed_library_tubes, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :barcode
      t.string    :barcode_prefix, :limit =>2
      t.boolean   :closed
      t.string    :state, :limit => 50
      t.string    :two_dimensional_barcode
      t.decimal   :volume, :precision => 5, :scale => 2
      t.decimal   :concentration, :precision => 5, :scale => 2
      t.boolean   :is_current
      t.timestamp :scanned_in_date
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_multiplexed_library_tubes_indices
    add_index :multiplexed_library_tubes, :uuid
    add_index :multiplexed_library_tubes, :internal_id
    add_index :multiplexed_library_tubes, :name
    add_index :multiplexed_library_tubes, :barcode
    add_index :multiplexed_library_tubes, :barcode_prefix
    add_index :multiplexed_library_tubes, :state
    add_index :multiplexed_library_tubes, :closed
    add_index :multiplexed_library_tubes, :two_dimensional_barcode
    add_index :multiplexed_library_tubes, :volume
    add_index :multiplexed_library_tubes, :concentration
    add_index :multiplexed_library_tubes, :is_current
    add_index :multiplexed_library_tubes, :checked_at
    add_index :multiplexed_library_tubes, :scanned_in_date
    add_index :multiplexed_library_tubes, :last_updated
    add_index :multiplexed_library_tubes, :created
  end

  def self.create_plates_table
    create_table :plates, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :barcode
      t.string    :barcode_prefix, :limit =>2
      t.integer   :plate_size
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end
  def self.create_plates_indices
    add_index :plates, :uuid
    add_index :plates, :internal_id
    add_index :plates, :name
    add_index :plates, :barcode
    add_index :plates, :barcode_prefix
    add_index :plates, :plate_size
    add_index :plates, :is_current
    add_index :plates, :checked_at
    add_index :plates, :last_updated
    add_index :plates, :created
  end

  def self.create_wells_table
    create_table :wells, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :map, :limit => 5
      t.string    :plate_barcode
      t.string    :plate_barcode_prefix, :limit =>2
      t.string    :sample_uuid, :limit => 36
      t.integer   :sample_internal_id
      t.string    :sample_name
      t.string    :gel_pass
      t.float     :concentration
      t.float     :current_volume
      t.float     :buffer_volume
      t.float     :requested_volume
      t.float     :picked_volume
      t.string    :pico_pass
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end
  def self.create_wells_indices
    add_index :wells, :uuid
    add_index :wells, :internal_id
    add_index :wells, :name
    add_index :wells, :name
    add_index :wells, :map
    add_index :wells, :plate_barcode
    add_index :wells, :sample_uuid
    add_index :wells, :sample_internal_id
    add_index :wells, :sample_name
    add_index :wells, :gel_pass
    add_index :wells, :concentration
    add_index :wells, :current_volume
    add_index :wells, :buffer_volume
    add_index :wells, :requested_volume
    add_index :wells, :picked_volume
    add_index :wells, :pico_pass
    add_index :wells, :is_current
    add_index :wells, :checked_at
    add_index :wells, :is_current
    add_index :wells, :last_updated
    add_index :wells, :created
  end

  def self.create_sample_tubes_table
    create_table :sample_tubes, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :name
      t.string    :barcode
      t.boolean   :closed
      t.string    :state, :limit => 50
      t.string    :two_dimensional_barcode
      t.string    :sample_uuid, :limit => 36
      t.integer   :sample_internal_id
      t.string    :sample_name
      t.timestamp :scanned_in_date
      t.decimal   :volume, :precision => 5, :scale => 2
      t.decimal   :concentration, :precision => 5, :scale => 2
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_sample_tubes_indices
    add_index :sample_tubes, :uuid
    add_index :sample_tubes, :internal_id
    add_index :sample_tubes, :name
    add_index :sample_tubes, :barcode
    add_index :sample_tubes, :state
    add_index :sample_tubes, :closed
    add_index :sample_tubes, :two_dimensional_barcode
    add_index :sample_tubes, :sample_uuid
    add_index :sample_tubes, :sample_name
    add_index :sample_tubes, :volume
    add_index :sample_tubes, :concentration
    add_index :sample_tubes, :is_current
    add_index :sample_tubes, :checked_at
    add_index :sample_tubes, :sample_internal_id
    add_index :sample_tubes, :scanned_in_date
    add_index :sample_tubes, :last_updated
    add_index :sample_tubes, :created
  end

  def self.create_requests_table
    create_table :requests, :force => true, :primary_key => :dont_use_id   do |t|
      t.integer :dont_use_id
      t.string  :uuid, :limit => 36, :null => false
      t.integer :internal_id
      t.string  :request_type
      t.string  :fragment_size_from
      t.string  :fragment_size_to
      t.integer :read_length
      t.string  :library_type
      t.string  :study_uuid, :limit => 36
      t.integer :study_internal_id
      t.string  :study_name
      t.string  :project_uuid, :limit => 36
      t.integer :project_internal_id
      t.string  :project_name
      t.string  :source_asset_uuid, :limit => 36
      t.integer :source_asset_internal_id
      t.string  :source_asset_type, :limit => 50
      t.string  :source_asset_name
      t.string  :source_asset_barcode
      t.string  :source_asset_barcode_prefix
      t.string  :source_asset_state
      t.string  :source_asset_closed
      t.string  :source_asset_two_dimensional_barcode
      t.string  :source_asset_sample_uuid, :limit => 36
      t.integer :source_asset_sample_internal_id
      t.string  :target_asset_uuid, :limit => 36
      t.integer :target_asset_internal_id
      t.string  :target_asset_type, :limit => 50
      t.string  :target_asset_name
      t.string  :target_asset_barcode
      t.string  :target_asset_barcode_prefix
      t.string  :target_asset_state
      t.string  :target_asset_closed
      t.string  :target_asset_two_dimensional_barcode
      t.string  :target_asset_sample_uuid, :limit => 36
      t.integer :target_asset_sample_internal_id
      t.boolean :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_requests_indices
    add_index :requests, :uuid
    add_index :requests, :internal_id
    add_index :requests, :study_uuid
    add_index :requests, :project_uuid
    add_index :requests, :study_internal_id
    add_index :requests, :project_internal_id
    add_index :requests, :fragment_size_from
    add_index :requests, :fragment_size_to
    add_index :requests, :library_type
    add_index :requests, :read_length
    add_index :requests, :source_asset_uuid
    add_index :requests, :source_asset_internal_id
    add_index :requests, :source_asset_type
    add_index :requests, :target_asset_uuid
    add_index :requests, :target_asset_internal_id
    add_index :requests, :target_asset_type
    add_index :requests, :request_type
    add_index :requests, :study_name
    add_index :requests, :project_name
    add_index :requests, :source_asset_name
    add_index :requests, :source_asset_barcode
    add_index :requests, :source_asset_barcode_prefix
    add_index :requests, :source_asset_state
    add_index :requests, :source_asset_closed
    add_index :requests, :source_asset_two_dimensional_barcode
    add_index :requests, :source_asset_sample_uuid
    add_index :requests, :source_asset_sample_internal_id
    add_index :requests, :target_asset_name
    add_index :requests, :target_asset_barcode
    add_index :requests, :target_asset_barcode_prefix
    add_index :requests, :target_asset_state
    add_index :requests, :target_asset_closed
    add_index :requests, :target_asset_two_dimensional_barcode
    add_index :requests, :target_asset_sample_uuid
    add_index :requests, :target_asset_sample_internal_id
    add_index :requests, :is_current
    add_index :requests, :checked_at
    add_index :requests, :last_updated
    add_index :requests, :created
  end


  def self.create_batches_table
    create_table :batches, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :created_by, :limit => 30
      t.string    :assigned_to, :limit => 30
      t.string    :pipeline_name
      t.string    :pipeline_uuid, :limit => 36
      t.integer   :pipeline_internal_id
      t.string    :state, :limit => 50
      t.string    :qc_state, :limit => 50
      t.string    :production_state, :limit => 50
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_batches_indices
    add_index :batches, :uuid
    add_index :batches, :internal_id
    add_index :batches, :created_by
    add_index :batches, :assigned_to
    add_index :batches, :pipeline_name
    add_index :batches, :pipeline_uuid
    add_index :batches, :pipeline_internal_id
    add_index :batches, :state
    add_index :batches, :qc_state
    add_index :batches, :production_state
    add_index :batches, :is_current
    add_index :batches, :checked_at
    add_index :batches, :last_updated
    add_index :batches, :created
  end

  def self.create_batch_requests_table
    create_table :batch_requests, :force => true, :primary_key => :dont_use_id  do |t|
      t.integer   :dont_use_id
      t.string    :uuid, :limit => 36, :null => false
      t.integer   :internal_id
      t.string    :batch_uuid, :limit => 36
      t.integer   :batch_internal_id
      t.string    :request_uuid, :limit => 36
      t.integer   :request_internal_id
      t.string    :request_type
      t.string    :source_asset_uuid, :limit => 36
      t.integer   :source_asset_internal_id
      t.string    :source_asset_name
      t.string    :target_asset_uuid, :limit => 36
      t.integer   :target_asset_internal_id
      t.string    :target_asset_name
      t.boolean   :is_current
      t.timestamp :checked_at
      t.timestamp :last_updated
      t.timestamp :created
    end
  end

  def self.create_batch_requests_indices
    add_index :batch_requests, :uuid
    add_index :batch_requests, :internal_id
    add_index :batch_requests, :batch_uuid
    add_index :batch_requests, :batch_internal_id
    add_index :batch_requests, :request_uuid
    add_index :batch_requests, :request_internal_id
    add_index :batch_requests, :request_type
    add_index :batch_requests, :source_asset_uuid
    add_index :batch_requests, :source_asset_internal_id
    add_index :batch_requests, :source_asset_name
    add_index :batch_requests, :target_asset_uuid
    add_index :batch_requests, :target_asset_internal_id
    add_index :batch_requests, :target_asset_name
    add_index :batch_requests, :is_current
    add_index :batch_requests, :checked_at
    add_index :batch_requests, :last_updated
    add_index :batch_requests, :created
  end

  def self.down
    drop_table :uuid_links
    drop_table :uuid_objects
    drop_table :studies
    drop_table :samples
    drop_table :projects
    drop_table :library_tubes
    drop_table :lanes
    drop_table :multiplexed_library_tubes
    drop_table :plates
    drop_table :wells
    drop_table :sample_tubes
    drop_table :requests
  end
end