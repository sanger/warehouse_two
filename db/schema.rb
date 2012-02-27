# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120223102325) do

  create_table "aliquots", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                   :limit => 16, :null => false
    t.integer  "internal_id"
    t.binary   "receptacle_uuid",        :limit => 16
    t.integer  "receptacle_internal_id"
    t.binary   "study_uuid",             :limit => 16
    t.integer  "study_internal_id"
    t.binary   "project_uuid",           :limit => 16
    t.integer  "project_internal_id"
    t.binary   "library_uuid",           :limit => 16
    t.integer  "library_internal_id"
    t.binary   "sample_uuid",            :limit => 16
    t.integer  "sample_internal_id"
    t.binary   "tag_uuid",               :limit => 16
    t.integer  "tag_internal_id"
    t.string   "receptacle_type"
    t.string   "library_type"
    t.integer  "insert_size_from"
    t.integer  "insert_size_to"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "aliquots", ["sample_uuid", "receptacle_uuid", "is_current"], :name => "sample_uuid_and_receptacle_uuid_and_is_current_idx"
  add_index "aliquots", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "asset_audits", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                 :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "key"
    t.string   "message"
    t.string   "created_by"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "asset_barcode"
    t.string   "asset_barcode_prefix"
    t.binary   "asset_uuid",           :limit => 16
    t.string   "witnessed_by"
    t.datetime "inserted_at"
  end

  add_index "asset_audits", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "asset_freezers", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",           :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "asset_type"
    t.string   "barcode"
    t.string   "barcode_prefix"
    t.string   "building"
    t.string   "room"
    t.string   "freezer"
    t.string   "shelf"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "asset_freezers", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "asset_links", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                   :limit => 16, :null => false
    t.binary   "ancestor_uuid",          :limit => 16
    t.integer  "ancestor_internal_id"
    t.string   "ancestor_type"
    t.binary   "descendant_uuid",        :limit => 16
    t.integer  "descendant_internal_id"
    t.string   "descendant_type"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "asset_links", ["ancestor_uuid", "descendant_uuid", "is_current"], :name => "ancestor_uuid_and_descendant_uuid_and_is_current_idx"
  add_index "asset_links", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "batch_requests", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                     :limit => 16, :null => false
    t.integer  "internal_id"
    t.binary   "batch_uuid",               :limit => 16
    t.integer  "batch_internal_id"
    t.binary   "request_uuid",             :limit => 16
    t.integer  "request_internal_id"
    t.string   "request_type"
    t.binary   "source_asset_uuid",        :limit => 16
    t.integer  "source_asset_internal_id"
    t.string   "source_asset_name"
    t.binary   "target_asset_uuid",        :limit => 16
    t.integer  "target_asset_internal_id"
    t.string   "target_asset_name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "batch_requests", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "batches", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                 :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "created_by",           :limit => 30
    t.string   "assigned_to",          :limit => 30
    t.string   "pipeline_name"
    t.binary   "pipeline_uuid",        :limit => 16
    t.integer  "pipeline_internal_id"
    t.string   "state",                :limit => 50
    t.string   "qc_state",             :limit => 50
    t.string   "production_state",     :limit => 50
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "batches", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "billing_events", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "reference"
    t.integer  "project_internal_id"
    t.binary   "project_uuid",        :limit => 16
    t.string   "project_name"
    t.string   "division"
    t.string   "created_by"
    t.integer  "request_internal_id"
    t.binary   "request_uuid",        :limit => 16
    t.string   "request_type"
    t.string   "library_type"
    t.string   "cost_code"
    t.integer  "price"
    t.float    "quantity"
    t.string   "kind"
    t.string   "description"
    t.boolean  "is_current"
    t.datetime "entry_date"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "billing_events", ["project_uuid", "request_uuid", "is_current"], :name => "project_uuid_and_request_uuid_and_is_current_idx"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "events", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",               :limit => 16, :null => false
    t.integer  "internal_id"
    t.integer  "source_internal_id"
    t.binary   "source_uuid",        :limit => 16
    t.string   "source_type"
    t.string   "message"
    t.string   "state"
    t.string   "identifier"
    t.string   "location"
    t.boolean  "actioned"
    t.text     "content"
    t.string   "created_by"
    t.string   "of_interest_to"
    t.string   "descriptor_key"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "events", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "lanes", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                    :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.boolean  "external_release"
    t.boolean  "is_current"
    t.date     "scanned_in_date"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "lanes", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "library_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                        :limit => 16,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",              :limit => 2
    t.boolean  "closed"
    t.string   "state",                       :limit => 50
    t.string   "two_dimensional_barcode"
    t.binary   "sample_uuid",                 :limit => 16
    t.integer  "sample_internal_id"
    t.decimal  "volume",                                    :precision => 5, :scale => 2
    t.decimal  "concentration",                             :precision => 5, :scale => 2
    t.binary   "tag_uuid",                    :limit => 16
    t.integer  "tag_internal_id"
    t.string   "expected_sequence"
    t.integer  "tag_map_id"
    t.string   "tag_group_name"
    t.binary   "tag_group_uuid",              :limit => 16
    t.integer  "tag_group_internal_id"
    t.integer  "source_request_internal_id"
    t.binary   "source_request_uuid",         :limit => 16
    t.string   "library_type"
    t.string   "fragment_size_required_from"
    t.string   "fragment_size_required_to"
    t.string   "sample_name"
    t.boolean  "is_current"
    t.date     "scanned_in_date"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
  end

  add_index "library_tubes", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "multiplexed_library_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.decimal  "volume",                                :precision => 5, :scale => 2
    t.decimal  "concentration",                         :precision => 5, :scale => 2
    t.boolean  "is_current"
    t.date     "scanned_in_date"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
    t.string   "submission_uuid",                      :limit => 36
    t.integer  "submission_internal_id"
  end

  add_index "multiplexed_library_tubes", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "plate_purposes", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "plate_purposes", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "plates", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                      :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",            :limit => 2
    t.integer  "plate_size"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "plate_purpose_name"
    t.integer  "plate_purpose_internal_id"
    t.binary   "plate_purpose_uuid",        :limit => 16
    t.string   "infinium_barcode"
    t.string   "location"
    t.datetime "inserted_at"
  end

  add_index "plates", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "projects", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                    :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "collaborators"
    t.text     "funding_comments"
    t.string   "cost_code"
    t.string   "funding_model"
    t.boolean  "approved"
    t.string   "budget_division"
    t.string   "external_funding_source"
    t.string   "project_manager"
    t.string   "budget_cost_centre"
    t.string   "state",                   :limit => 50
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "projects", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "pulldown_multiplexed_library_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.string   "state",                   :limit => 50
    t.boolean  "closed"
    t.decimal  "concentration",                         :precision => 5, :scale => 2
    t.decimal  "volume",                                :precision => 5, :scale => 2
    t.string   "two_dimensional_barcode"
    t.date     "scanned_in_date"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
  end

  add_index "pulldown_multiplexed_library_tubes", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "quotas", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                :limit => 16, :null => false
    t.integer  "internal_id"
    t.integer  "quota_limit"
    t.string   "request_type"
    t.integer  "project_internal_id"
    t.binary   "project_uuid",        :limit => 16
    t.string   "project_name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "quotas", ["project_uuid", "request_type", "is_current"], :name => "project_uuid_and_request_type_and_is_current_idx"

  create_table "requests", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                                 :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "request_type"
    t.string   "fragment_size_from"
    t.string   "fragment_size_to"
    t.integer  "read_length"
    t.string   "library_type"
    t.binary   "study_uuid",                           :limit => 16
    t.integer  "study_internal_id"
    t.string   "study_name"
    t.binary   "project_uuid",                         :limit => 16
    t.integer  "project_internal_id"
    t.string   "project_name"
    t.binary   "source_asset_uuid",                    :limit => 16
    t.integer  "source_asset_internal_id"
    t.string   "source_asset_type",                    :limit => 50
    t.string   "source_asset_name"
    t.string   "source_asset_barcode"
    t.string   "source_asset_barcode_prefix"
    t.string   "source_asset_state"
    t.string   "source_asset_closed"
    t.string   "source_asset_two_dimensional_barcode"
    t.binary   "source_asset_sample_uuid",             :limit => 16
    t.integer  "source_asset_sample_internal_id"
    t.binary   "target_asset_uuid",                    :limit => 16
    t.integer  "target_asset_internal_id"
    t.string   "target_asset_type",                    :limit => 50
    t.string   "target_asset_name"
    t.string   "target_asset_barcode"
    t.string   "target_asset_barcode_prefix"
    t.string   "target_asset_state"
    t.string   "target_asset_closed"
    t.string   "target_asset_two_dimensional_barcode"
    t.binary   "target_asset_sample_uuid",             :limit => 16
    t.integer  "target_asset_sample_internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "state",                                :limit => 40
    t.integer  "priority"
    t.string   "user"
    t.datetime "inserted_at"
  end

  add_index "requests", ["source_asset_uuid", "request_type", "is_current"], :name => "source_asset_uuid_and_request_type_and_is_current_idx"
  add_index "requests", ["target_asset_uuid", "request_type", "is_current"], :name => "target_asset_uuid_and_request_type_and_is_current_idx"
  add_index "requests", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "sample_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.binary   "sample_uuid",             :limit => 16
    t.integer  "sample_internal_id"
    t.string   "sample_name"
    t.date     "scanned_in_date"
    t.decimal  "volume",                                :precision => 5, :scale => 2
    t.decimal  "concentration",                         :precision => 5, :scale => 2
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "barcode_prefix",          :limit => 2
    t.datetime "inserted_at"
  end

  add_index "sample_tubes", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "samples", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                       :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "reference_genome"
    t.string   "organism"
    t.string   "accession_number",           :limit => 50
    t.string   "common_name"
    t.text     "description"
    t.string   "taxon_id"
    t.string   "father"
    t.string   "mother"
    t.string   "replicate"
    t.string   "ethnicity"
    t.string   "gender",                     :limit => 20
    t.string   "cohort"
    t.string   "country_of_origin"
    t.string   "geographical_region"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "sanger_sample_id"
    t.boolean  "control"
    t.boolean  "empty_supplier_sample_name"
    t.string   "supplier_name"
    t.string   "public_name"
    t.string   "sample_visibility"
    t.string   "strain"
    t.boolean  "updated_by_manifest"
    t.datetime "inserted_at"
  end

  add_index "samples", ["internal_id", "is_current"], :name => "internal_id_and_is_current_idx"
  add_index "samples", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "studies", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                           :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "reference_genome"
    t.boolean  "ethically_approved"
    t.string   "faculty_sponsor"
    t.string   "state",                          :limit => 50
    t.string   "study_type",                     :limit => 50
    t.text     "abstract"
    t.string   "abbreviation"
    t.string   "accession_number",               :limit => 50
    t.text     "description"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "contains_human_dna"
    t.string   "contaminated_human_dna"
    t.string   "data_release_strategy"
    t.string   "data_release_sort_of_study"
    t.string   "ena_project_id"
    t.string   "study_title"
    t.string   "study_visibility"
    t.string   "ega_dac_accession_number"
    t.string   "array_express_accession_number"
    t.string   "ega_policy_accession_number"
    t.datetime "inserted_at"
  end

  add_index "studies", ["internal_id", "is_current"], :name => "internal_id_and_is_current_idx"
  add_index "studies", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "study_samples", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",               :limit => 16, :null => false
    t.integer  "internal_id"
    t.integer  "sample_internal_id"
    t.binary   "sample_uuid",        :limit => 16
    t.integer  "study_internal_id"
    t.binary   "study_uuid",         :limit => 16
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "study_samples", ["sample_uuid", "study_uuid", "is_current"], :name => "sample_uuid_and_study_uuid_and_is_current_idx"
  add_index "study_samples", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "submissions", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                        :limit => 16, :null => false
    t.integer  "internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "created_by"
    t.string   "template_name"
    t.string   "state"
    t.string   "study_name"
    t.binary   "study_uuid",                  :limit => 16
    t.string   "project_name"
    t.binary   "project_uuid",                :limit => 16
    t.string   "message"
    t.string   "comments"
    t.datetime "inserted_at"
    t.integer  "read_length"
    t.string   "fragment_size_required_from"
    t.string   "fragment_size_required_to"
    t.string   "library_type"
    t.string   "sequencing_type"
    t.integer  "insert_size"
    t.integer  "number_of_lanes"
  end

  add_index "submissions", ["study_uuid", "is_current", "project_uuid"], :name => "study_uuid_and_is_current_and_project_uuid_idx"
  add_index "submissions", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "submitted_assets", :primary_key => "dont_use_id", :force => true do |t|
    t.binary "submission_uuid", :limit => 16
    t.binary "asset_uuid",      :limit => 16
  end

  add_index "submitted_assets", ["submission_uuid", "asset_uuid"], :name => "submission_uuid_and_asset_uuid_idx"

  create_table "tags", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                  :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "expected_sequence"
    t.integer  "map_id"
    t.string   "tag_group_name"
    t.binary   "tag_group_uuid",        :limit => 16
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "tags", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

  create_table "uuid_objects", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "object_name"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.boolean  "deleted"
  end

  add_index "uuid_objects", ["uuid"], :name => "uuid_idx"

  create_table "wells", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "map",                     :limit => 5
    t.string   "plate_barcode"
    t.string   "plate_barcode_prefix",    :limit => 2
    t.binary   "sample_uuid",             :limit => 16
    t.integer  "sample_internal_id"
    t.string   "sample_name"
    t.string   "gel_pass"
    t.float    "concentration"
    t.float    "current_volume"
    t.float    "buffer_volume"
    t.float    "requested_volume"
    t.float    "picked_volume"
    t.string   "pico_pass"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.binary   "plate_uuid",              :limit => 16
    t.decimal  "measured_volume",                       :precision => 5, :scale => 2
    t.integer  "sequenom_count"
    t.string   "gender_markers",          :limit => 40
    t.string   "genotyping_status"
    t.string   "genotyping_snp_plate_id"
    t.datetime "inserted_at"
  end

  add_index "wells", ["uuid", "is_current"], :name => "uuid_and_is_current_idx"

end
  add_index "requests", ["submission_uuid"], :name => "index_requests_on_submission_uuid"
