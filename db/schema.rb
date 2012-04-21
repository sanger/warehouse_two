# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120421090554) do

  create_table "aliquots", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                         :null => false
    t.datetime "current_to"
  end

  add_index "aliquots", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "aliquots", ["receptacle_uuid", "sample_uuid", "current_to", "current_from"], :name => "receptacle_uuid_and_sample_uuid_and_current_idx"
  add_index "aliquots", ["sample_uuid", "receptacle_uuid", "current_to", "current_from"], :name => "sample_uuid_and_receptacle_uuid_and_current_idx"
  add_index "aliquots", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "asset_audits", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                       :null => false
    t.datetime "current_to"
  end

  add_index "asset_audits", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "asset_audits", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

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

  create_table "asset_links", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                         :null => false
    t.datetime "current_to"
  end

  add_index "asset_links", ["ancestor_uuid", "descendant_uuid", "current_to", "current_from"], :name => "ancestor_uuid_and_descendant_uuid_and_current_idx"
  add_index "asset_links", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "asset_links", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "batch_requests", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                           :null => false
    t.datetime "current_to"
  end

  add_index "batch_requests", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "batch_requests", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "batches", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                       :null => false
    t.datetime "current_to"
  end

  add_index "batches", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "batches", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "billing_events", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                      :null => false
    t.datetime "current_to"
  end

  add_index "billing_events", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "billing_events", ["project_uuid", "request_uuid", "current_to", "current_from"], :name => "project_uuid_and_request_uuid_and_current_idx"
  add_index "billing_events", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

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

  create_table "events", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                     :null => false
    t.datetime "current_to"
  end

  add_index "events", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "events", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "lanes", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                          :null => false
    t.datetime "current_to"
  end

  add_index "lanes", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "lanes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "library_tubes", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                                                            :null => false
    t.datetime "current_to"
  end

  add_index "library_tubes", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "library_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "multiplexed_library_tubes", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                                                        :null => false
    t.datetime "current_to"
  end

  add_index "multiplexed_library_tubes", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "multiplexed_library_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "orders", :id => false, :force => true do |t|
    t.binary   "uuid",                        :limit => 16, :null => false
    t.integer  "internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "created_by"
    t.string   "template_name"
    t.string   "study_name"
    t.binary   "study_uuid",                  :limit => 16
    t.string   "project_name"
    t.binary   "project_uuid",                :limit => 16
    t.string   "comments"
    t.datetime "inserted_at"
    t.integer  "read_length"
    t.string   "fragment_size_required_from"
    t.string   "fragment_size_required_to"
    t.string   "library_type"
    t.string   "sequencing_type"
    t.integer  "insert_size"
    t.integer  "number_of_lanes"
    t.binary   "submission_uuid",             :limit => 16
    t.datetime "deleted_at"
    t.datetime "current_from",                              :null => false
    t.datetime "current_to"
  end

  add_index "orders", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "orders", ["study_uuid", "current_to", "current_from", "project_uuid"], :name => "study_uuid_and_current_and_project_uuid_idx"
  add_index "orders", ["study_uuid", "current_to", "project_uuid", "current_from"], :name => "study_uuid_and_current_to_and_project_uuid_and_current_from_idx"
  add_index "orders", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "plate_purposes", :id => false, :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",               :null => false
    t.datetime "current_to"
  end

  add_index "plate_purposes", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "plate_purposes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "plates", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                            :null => false
    t.datetime "current_to"
  end

  add_index "plates", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "plates", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "projects", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                          :null => false
    t.datetime "current_to"
  end

  add_index "projects", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "projects", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "quotas", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                      :null => false
    t.datetime "current_to"
  end

  add_index "quotas", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "quotas", ["project_uuid", "request_type", "current_to", "current_from"], :name => "project_uuid_and_request_type_and_current_idx"
  add_index "quotas", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "requests", :id => false, :force => true do |t|
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
    t.boolean  "source_asset_closed"
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
    t.boolean  "target_asset_closed"
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
    t.datetime "deleted_at"
    t.binary   "submission_uuid",                      :limit => 16
    t.integer  "submission_internal_id"
    t.datetime "current_from",                                       :null => false
    t.datetime "current_to"
  end

  add_index "requests", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "requests", ["source_asset_uuid", "request_type", "current_to", "current_from"], :name => "source_asset_uuid_and_request_type_and_current_idx"
  add_index "requests", ["submission_uuid", "current_to", "current_from"], :name => "submission_uuid_and_current_idx"
  add_index "requests", ["target_asset_uuid", "request_type", "current_to", "current_from"], :name => "target_asset_uuid_and_request_type_and_current_idx"
  add_index "requests", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "sample_tubes", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                                                        :null => false
    t.datetime "current_to"
  end

  add_index "sample_tubes", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "sample_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "samples", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                             :null => false
    t.datetime "current_to"
  end

  add_index "samples", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "samples", ["internal_id", "current_to", "current_from"], :name => "internal_id_and_current_idx"
  add_index "samples", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "studies", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                                 :null => false
    t.datetime "current_to"
  end

  add_index "studies", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "studies", ["internal_id", "current_to", "current_from"], :name => "internal_id_and_current_idx"
  add_index "studies", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "study_samples", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                     :null => false
    t.datetime "current_to"
  end

  add_index "study_samples", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "study_samples", ["sample_uuid", "study_uuid", "current_to", "current_from"], :name => "sample_uuid_and_study_uuid_and_current_idx"
  add_index "study_samples", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "submissions", :id => false, :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "created_by"
    t.string   "state"
    t.string   "message"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",               :null => false
    t.datetime "current_to"
  end

  add_index "submissions", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "submissions", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "submitted_assets", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "order_uuid", :limit => 16
    t.binary   "asset_uuid", :limit => 16
    t.datetime "deleted_at"
  end

  add_index "submitted_assets", ["order_uuid", "asset_uuid"], :name => "submission_uuid_and_asset_uuid_idx"

  create_table "tags", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                        :null => false
    t.datetime "current_to"
  end

  add_index "tags", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "tags", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_table "wells", :id => false, :force => true do |t|
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
    t.datetime "deleted_at"
    t.datetime "current_from",                                                        :null => false
    t.datetime "current_to"
  end

  add_index "wells", ["current_to", "uuid", "current_from"], :name => "primary_partitioning_key", :unique => true
  add_index "wells", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx"

  create_view "current_aliquots", "select `aliquots`.`uuid` AS `uuid`,`aliquots`.`internal_id` AS `internal_id`,`aliquots`.`receptacle_uuid` AS `receptacle_uuid`,`aliquots`.`receptacle_internal_id` AS `receptacle_internal_id`,`aliquots`.`study_uuid` AS `study_uuid`,`aliquots`.`study_internal_id` AS `study_internal_id`,`aliquots`.`project_uuid` AS `project_uuid`,`aliquots`.`project_internal_id` AS `project_internal_id`,`aliquots`.`library_uuid` AS `library_uuid`,`aliquots`.`library_internal_id` AS `library_internal_id`,`aliquots`.`sample_uuid` AS `sample_uuid`,`aliquots`.`sample_internal_id` AS `sample_internal_id`,`aliquots`.`tag_uuid` AS `tag_uuid`,`aliquots`.`tag_internal_id` AS `tag_internal_id`,`aliquots`.`receptacle_type` AS `receptacle_type`,`aliquots`.`library_type` AS `library_type`,`aliquots`.`insert_size_from` AS `insert_size_from`,`aliquots`.`insert_size_to` AS `insert_size_to`,`aliquots`.`is_current` AS `is_current`,`aliquots`.`checked_at` AS `checked_at`,`aliquots`.`last_updated` AS `last_updated`,`aliquots`.`created` AS `created`,`aliquots`.`inserted_at` AS `inserted_at`,`aliquots`.`deleted_at` AS `deleted_at`,`aliquots`.`current_from` AS `current_from`,`aliquots`.`current_to` AS `current_to` from `aliquots` where isnull(`aliquots`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :receptacle_uuid
    v.column :receptacle_internal_id
    v.column :study_uuid
    v.column :study_internal_id
    v.column :project_uuid
    v.column :project_internal_id
    v.column :library_uuid
    v.column :library_internal_id
    v.column :sample_uuid
    v.column :sample_internal_id
    v.column :tag_uuid
    v.column :tag_internal_id
    v.column :receptacle_type
    v.column :library_type
    v.column :insert_size_from
    v.column :insert_size_to
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_asset_audits", "select `asset_audits`.`uuid` AS `uuid`,`asset_audits`.`internal_id` AS `internal_id`,`asset_audits`.`key` AS `key`,`asset_audits`.`message` AS `message`,`asset_audits`.`created_by` AS `created_by`,`asset_audits`.`is_current` AS `is_current`,`asset_audits`.`checked_at` AS `checked_at`,`asset_audits`.`last_updated` AS `last_updated`,`asset_audits`.`created` AS `created`,`asset_audits`.`asset_barcode` AS `asset_barcode`,`asset_audits`.`asset_barcode_prefix` AS `asset_barcode_prefix`,`asset_audits`.`asset_uuid` AS `asset_uuid`,`asset_audits`.`witnessed_by` AS `witnessed_by`,`asset_audits`.`inserted_at` AS `inserted_at`,`asset_audits`.`deleted_at` AS `deleted_at`,`asset_audits`.`current_from` AS `current_from`,`asset_audits`.`current_to` AS `current_to` from `asset_audits` where isnull(`asset_audits`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :key
    v.column :message
    v.column :created_by
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :asset_barcode
    v.column :asset_barcode_prefix
    v.column :asset_uuid
    v.column :witnessed_by
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_asset_links", "select `asset_links`.`uuid` AS `uuid`,`asset_links`.`ancestor_uuid` AS `ancestor_uuid`,`asset_links`.`ancestor_internal_id` AS `ancestor_internal_id`,`asset_links`.`ancestor_type` AS `ancestor_type`,`asset_links`.`descendant_uuid` AS `descendant_uuid`,`asset_links`.`descendant_internal_id` AS `descendant_internal_id`,`asset_links`.`descendant_type` AS `descendant_type`,`asset_links`.`is_current` AS `is_current`,`asset_links`.`checked_at` AS `checked_at`,`asset_links`.`last_updated` AS `last_updated`,`asset_links`.`created` AS `created`,`asset_links`.`inserted_at` AS `inserted_at`,`asset_links`.`deleted_at` AS `deleted_at`,`asset_links`.`current_from` AS `current_from`,`asset_links`.`current_to` AS `current_to` from `asset_links` where isnull(`asset_links`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :ancestor_uuid
    v.column :ancestor_internal_id
    v.column :ancestor_type
    v.column :descendant_uuid
    v.column :descendant_internal_id
    v.column :descendant_type
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_batch_requests", "select `batch_requests`.`uuid` AS `uuid`,`batch_requests`.`internal_id` AS `internal_id`,`batch_requests`.`batch_uuid` AS `batch_uuid`,`batch_requests`.`batch_internal_id` AS `batch_internal_id`,`batch_requests`.`request_uuid` AS `request_uuid`,`batch_requests`.`request_internal_id` AS `request_internal_id`,`batch_requests`.`request_type` AS `request_type`,`batch_requests`.`source_asset_uuid` AS `source_asset_uuid`,`batch_requests`.`source_asset_internal_id` AS `source_asset_internal_id`,`batch_requests`.`source_asset_name` AS `source_asset_name`,`batch_requests`.`target_asset_uuid` AS `target_asset_uuid`,`batch_requests`.`target_asset_internal_id` AS `target_asset_internal_id`,`batch_requests`.`target_asset_name` AS `target_asset_name`,`batch_requests`.`is_current` AS `is_current`,`batch_requests`.`checked_at` AS `checked_at`,`batch_requests`.`last_updated` AS `last_updated`,`batch_requests`.`created` AS `created`,`batch_requests`.`inserted_at` AS `inserted_at`,`batch_requests`.`deleted_at` AS `deleted_at`,`batch_requests`.`current_from` AS `current_from`,`batch_requests`.`current_to` AS `current_to` from `batch_requests` where isnull(`batch_requests`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :batch_uuid
    v.column :batch_internal_id
    v.column :request_uuid
    v.column :request_internal_id
    v.column :request_type
    v.column :source_asset_uuid
    v.column :source_asset_internal_id
    v.column :source_asset_name
    v.column :target_asset_uuid
    v.column :target_asset_internal_id
    v.column :target_asset_name
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_batches", "select `batches`.`uuid` AS `uuid`,`batches`.`internal_id` AS `internal_id`,`batches`.`created_by` AS `created_by`,`batches`.`assigned_to` AS `assigned_to`,`batches`.`pipeline_name` AS `pipeline_name`,`batches`.`pipeline_uuid` AS `pipeline_uuid`,`batches`.`pipeline_internal_id` AS `pipeline_internal_id`,`batches`.`state` AS `state`,`batches`.`qc_state` AS `qc_state`,`batches`.`production_state` AS `production_state`,`batches`.`is_current` AS `is_current`,`batches`.`checked_at` AS `checked_at`,`batches`.`last_updated` AS `last_updated`,`batches`.`created` AS `created`,`batches`.`inserted_at` AS `inserted_at`,`batches`.`deleted_at` AS `deleted_at`,`batches`.`current_from` AS `current_from`,`batches`.`current_to` AS `current_to` from `batches` where isnull(`batches`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :created_by
    v.column :assigned_to
    v.column :pipeline_name
    v.column :pipeline_uuid
    v.column :pipeline_internal_id
    v.column :state
    v.column :qc_state
    v.column :production_state
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_billing_events", "select `billing_events`.`uuid` AS `uuid`,`billing_events`.`internal_id` AS `internal_id`,`billing_events`.`reference` AS `reference`,`billing_events`.`project_internal_id` AS `project_internal_id`,`billing_events`.`project_uuid` AS `project_uuid`,`billing_events`.`project_name` AS `project_name`,`billing_events`.`division` AS `division`,`billing_events`.`created_by` AS `created_by`,`billing_events`.`request_internal_id` AS `request_internal_id`,`billing_events`.`request_uuid` AS `request_uuid`,`billing_events`.`request_type` AS `request_type`,`billing_events`.`library_type` AS `library_type`,`billing_events`.`cost_code` AS `cost_code`,`billing_events`.`price` AS `price`,`billing_events`.`quantity` AS `quantity`,`billing_events`.`kind` AS `kind`,`billing_events`.`description` AS `description`,`billing_events`.`is_current` AS `is_current`,`billing_events`.`entry_date` AS `entry_date`,`billing_events`.`checked_at` AS `checked_at`,`billing_events`.`last_updated` AS `last_updated`,`billing_events`.`created` AS `created`,`billing_events`.`inserted_at` AS `inserted_at`,`billing_events`.`deleted_at` AS `deleted_at`,`billing_events`.`current_from` AS `current_from`,`billing_events`.`current_to` AS `current_to` from `billing_events` where isnull(`billing_events`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :reference
    v.column :project_internal_id
    v.column :project_uuid
    v.column :project_name
    v.column :division
    v.column :created_by
    v.column :request_internal_id
    v.column :request_uuid
    v.column :request_type
    v.column :library_type
    v.column :cost_code
    v.column :price
    v.column :quantity
    v.column :kind
    v.column :description
    v.column :is_current
    v.column :entry_date
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_events", "select `events`.`uuid` AS `uuid`,`events`.`internal_id` AS `internal_id`,`events`.`source_internal_id` AS `source_internal_id`,`events`.`source_uuid` AS `source_uuid`,`events`.`source_type` AS `source_type`,`events`.`message` AS `message`,`events`.`state` AS `state`,`events`.`identifier` AS `identifier`,`events`.`location` AS `location`,`events`.`actioned` AS `actioned`,`events`.`content` AS `content`,`events`.`created_by` AS `created_by`,`events`.`of_interest_to` AS `of_interest_to`,`events`.`descriptor_key` AS `descriptor_key`,`events`.`is_current` AS `is_current`,`events`.`checked_at` AS `checked_at`,`events`.`last_updated` AS `last_updated`,`events`.`created` AS `created`,`events`.`inserted_at` AS `inserted_at`,`events`.`deleted_at` AS `deleted_at`,`events`.`current_from` AS `current_from`,`events`.`current_to` AS `current_to` from `events` where isnull(`events`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :source_internal_id
    v.column :source_uuid
    v.column :source_type
    v.column :message
    v.column :state
    v.column :identifier
    v.column :location
    v.column :actioned
    v.column :content
    v.column :created_by
    v.column :of_interest_to
    v.column :descriptor_key
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_lanes", "select `lanes`.`uuid` AS `uuid`,`lanes`.`internal_id` AS `internal_id`,`lanes`.`name` AS `name`,`lanes`.`barcode` AS `barcode`,`lanes`.`barcode_prefix` AS `barcode_prefix`,`lanes`.`closed` AS `closed`,`lanes`.`state` AS `state`,`lanes`.`two_dimensional_barcode` AS `two_dimensional_barcode`,`lanes`.`external_release` AS `external_release`,`lanes`.`is_current` AS `is_current`,`lanes`.`scanned_in_date` AS `scanned_in_date`,`lanes`.`checked_at` AS `checked_at`,`lanes`.`last_updated` AS `last_updated`,`lanes`.`created` AS `created`,`lanes`.`inserted_at` AS `inserted_at`,`lanes`.`deleted_at` AS `deleted_at`,`lanes`.`current_from` AS `current_from`,`lanes`.`current_to` AS `current_to` from `lanes` where isnull(`lanes`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :barcode
    v.column :barcode_prefix
    v.column :closed
    v.column :state
    v.column :two_dimensional_barcode
    v.column :external_release
    v.column :is_current
    v.column :scanned_in_date
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_library_tubes", "select `library_tubes`.`uuid` AS `uuid`,`library_tubes`.`internal_id` AS `internal_id`,`library_tubes`.`name` AS `name`,`library_tubes`.`barcode` AS `barcode`,`library_tubes`.`barcode_prefix` AS `barcode_prefix`,`library_tubes`.`closed` AS `closed`,`library_tubes`.`state` AS `state`,`library_tubes`.`two_dimensional_barcode` AS `two_dimensional_barcode`,`library_tubes`.`sample_uuid` AS `sample_uuid`,`library_tubes`.`sample_internal_id` AS `sample_internal_id`,`library_tubes`.`volume` AS `volume`,`library_tubes`.`concentration` AS `concentration`,`library_tubes`.`tag_uuid` AS `tag_uuid`,`library_tubes`.`tag_internal_id` AS `tag_internal_id`,`library_tubes`.`expected_sequence` AS `expected_sequence`,`library_tubes`.`tag_map_id` AS `tag_map_id`,`library_tubes`.`tag_group_name` AS `tag_group_name`,`library_tubes`.`tag_group_uuid` AS `tag_group_uuid`,`library_tubes`.`tag_group_internal_id` AS `tag_group_internal_id`,`library_tubes`.`source_request_internal_id` AS `source_request_internal_id`,`library_tubes`.`source_request_uuid` AS `source_request_uuid`,`library_tubes`.`library_type` AS `library_type`,`library_tubes`.`fragment_size_required_from` AS `fragment_size_required_from`,`library_tubes`.`fragment_size_required_to` AS `fragment_size_required_to`,`library_tubes`.`sample_name` AS `sample_name`,`library_tubes`.`is_current` AS `is_current`,`library_tubes`.`scanned_in_date` AS `scanned_in_date`,`library_tubes`.`checked_at` AS `checked_at`,`library_tubes`.`last_updated` AS `last_updated`,`library_tubes`.`created` AS `created`,`library_tubes`.`public_name` AS `public_name`,`library_tubes`.`inserted_at` AS `inserted_at`,`library_tubes`.`deleted_at` AS `deleted_at`,`library_tubes`.`current_from` AS `current_from`,`library_tubes`.`current_to` AS `current_to` from `library_tubes` where isnull(`library_tubes`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :barcode
    v.column :barcode_prefix
    v.column :closed
    v.column :state
    v.column :two_dimensional_barcode
    v.column :sample_uuid
    v.column :sample_internal_id
    v.column :volume
    v.column :concentration
    v.column :tag_uuid
    v.column :tag_internal_id
    v.column :expected_sequence
    v.column :tag_map_id
    v.column :tag_group_name
    v.column :tag_group_uuid
    v.column :tag_group_internal_id
    v.column :source_request_internal_id
    v.column :source_request_uuid
    v.column :library_type
    v.column :fragment_size_required_from
    v.column :fragment_size_required_to
    v.column :sample_name
    v.column :is_current
    v.column :scanned_in_date
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :public_name
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_multiplexed_library_tubes", "select `multiplexed_library_tubes`.`uuid` AS `uuid`,`multiplexed_library_tubes`.`internal_id` AS `internal_id`,`multiplexed_library_tubes`.`name` AS `name`,`multiplexed_library_tubes`.`barcode` AS `barcode`,`multiplexed_library_tubes`.`barcode_prefix` AS `barcode_prefix`,`multiplexed_library_tubes`.`closed` AS `closed`,`multiplexed_library_tubes`.`state` AS `state`,`multiplexed_library_tubes`.`two_dimensional_barcode` AS `two_dimensional_barcode`,`multiplexed_library_tubes`.`volume` AS `volume`,`multiplexed_library_tubes`.`concentration` AS `concentration`,`multiplexed_library_tubes`.`is_current` AS `is_current`,`multiplexed_library_tubes`.`scanned_in_date` AS `scanned_in_date`,`multiplexed_library_tubes`.`checked_at` AS `checked_at`,`multiplexed_library_tubes`.`last_updated` AS `last_updated`,`multiplexed_library_tubes`.`created` AS `created`,`multiplexed_library_tubes`.`public_name` AS `public_name`,`multiplexed_library_tubes`.`inserted_at` AS `inserted_at`,`multiplexed_library_tubes`.`deleted_at` AS `deleted_at`,`multiplexed_library_tubes`.`current_from` AS `current_from`,`multiplexed_library_tubes`.`current_to` AS `current_to` from `multiplexed_library_tubes` where isnull(`multiplexed_library_tubes`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :barcode
    v.column :barcode_prefix
    v.column :closed
    v.column :state
    v.column :two_dimensional_barcode
    v.column :volume
    v.column :concentration
    v.column :is_current
    v.column :scanned_in_date
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :public_name
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_orders", "select `orders`.`uuid` AS `uuid`,`orders`.`internal_id` AS `internal_id`,`orders`.`is_current` AS `is_current`,`orders`.`checked_at` AS `checked_at`,`orders`.`last_updated` AS `last_updated`,`orders`.`created` AS `created`,`orders`.`created_by` AS `created_by`,`orders`.`template_name` AS `template_name`,`orders`.`study_name` AS `study_name`,`orders`.`study_uuid` AS `study_uuid`,`orders`.`project_name` AS `project_name`,`orders`.`project_uuid` AS `project_uuid`,`orders`.`comments` AS `comments`,`orders`.`inserted_at` AS `inserted_at`,`orders`.`read_length` AS `read_length`,`orders`.`fragment_size_required_from` AS `fragment_size_required_from`,`orders`.`fragment_size_required_to` AS `fragment_size_required_to`,`orders`.`library_type` AS `library_type`,`orders`.`sequencing_type` AS `sequencing_type`,`orders`.`insert_size` AS `insert_size`,`orders`.`number_of_lanes` AS `number_of_lanes`,`orders`.`submission_uuid` AS `submission_uuid`,`orders`.`deleted_at` AS `deleted_at`,`orders`.`current_from` AS `current_from`,`orders`.`current_to` AS `current_to` from `orders` where isnull(`orders`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :created_by
    v.column :template_name
    v.column :study_name
    v.column :study_uuid
    v.column :project_name
    v.column :project_uuid
    v.column :comments
    v.column :inserted_at
    v.column :read_length
    v.column :fragment_size_required_from
    v.column :fragment_size_required_to
    v.column :library_type
    v.column :sequencing_type
    v.column :insert_size
    v.column :number_of_lanes
    v.column :submission_uuid
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_plate_purposes", "select `plate_purposes`.`uuid` AS `uuid`,`plate_purposes`.`internal_id` AS `internal_id`,`plate_purposes`.`name` AS `name`,`plate_purposes`.`is_current` AS `is_current`,`plate_purposes`.`checked_at` AS `checked_at`,`plate_purposes`.`last_updated` AS `last_updated`,`plate_purposes`.`created` AS `created`,`plate_purposes`.`inserted_at` AS `inserted_at`,`plate_purposes`.`deleted_at` AS `deleted_at`,`plate_purposes`.`current_from` AS `current_from`,`plate_purposes`.`current_to` AS `current_to` from `plate_purposes` where isnull(`plate_purposes`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_plates", "select `plates`.`uuid` AS `uuid`,`plates`.`internal_id` AS `internal_id`,`plates`.`name` AS `name`,`plates`.`barcode` AS `barcode`,`plates`.`barcode_prefix` AS `barcode_prefix`,`plates`.`plate_size` AS `plate_size`,`plates`.`is_current` AS `is_current`,`plates`.`checked_at` AS `checked_at`,`plates`.`last_updated` AS `last_updated`,`plates`.`created` AS `created`,`plates`.`plate_purpose_name` AS `plate_purpose_name`,`plates`.`plate_purpose_internal_id` AS `plate_purpose_internal_id`,`plates`.`plate_purpose_uuid` AS `plate_purpose_uuid`,`plates`.`infinium_barcode` AS `infinium_barcode`,`plates`.`location` AS `location`,`plates`.`inserted_at` AS `inserted_at`,`plates`.`deleted_at` AS `deleted_at`,`plates`.`current_from` AS `current_from`,`plates`.`current_to` AS `current_to` from `plates` where isnull(`plates`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :barcode
    v.column :barcode_prefix
    v.column :plate_size
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :plate_purpose_name
    v.column :plate_purpose_internal_id
    v.column :plate_purpose_uuid
    v.column :infinium_barcode
    v.column :location
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_projects", "select `projects`.`uuid` AS `uuid`,`projects`.`internal_id` AS `internal_id`,`projects`.`name` AS `name`,`projects`.`collaborators` AS `collaborators`,`projects`.`funding_comments` AS `funding_comments`,`projects`.`cost_code` AS `cost_code`,`projects`.`funding_model` AS `funding_model`,`projects`.`approved` AS `approved`,`projects`.`budget_division` AS `budget_division`,`projects`.`external_funding_source` AS `external_funding_source`,`projects`.`project_manager` AS `project_manager`,`projects`.`budget_cost_centre` AS `budget_cost_centre`,`projects`.`state` AS `state`,`projects`.`is_current` AS `is_current`,`projects`.`checked_at` AS `checked_at`,`projects`.`last_updated` AS `last_updated`,`projects`.`created` AS `created`,`projects`.`inserted_at` AS `inserted_at`,`projects`.`deleted_at` AS `deleted_at`,`projects`.`current_from` AS `current_from`,`projects`.`current_to` AS `current_to` from `projects` where isnull(`projects`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :collaborators
    v.column :funding_comments
    v.column :cost_code
    v.column :funding_model
    v.column :approved
    v.column :budget_division
    v.column :external_funding_source
    v.column :project_manager
    v.column :budget_cost_centre
    v.column :state
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_quotas", "select `quotas`.`uuid` AS `uuid`,`quotas`.`internal_id` AS `internal_id`,`quotas`.`quota_limit` AS `quota_limit`,`quotas`.`request_type` AS `request_type`,`quotas`.`project_internal_id` AS `project_internal_id`,`quotas`.`project_uuid` AS `project_uuid`,`quotas`.`project_name` AS `project_name`,`quotas`.`is_current` AS `is_current`,`quotas`.`checked_at` AS `checked_at`,`quotas`.`last_updated` AS `last_updated`,`quotas`.`created` AS `created`,`quotas`.`inserted_at` AS `inserted_at`,`quotas`.`deleted_at` AS `deleted_at`,`quotas`.`current_from` AS `current_from`,`quotas`.`current_to` AS `current_to` from `quotas` where isnull(`quotas`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :quota_limit
    v.column :request_type
    v.column :project_internal_id
    v.column :project_uuid
    v.column :project_name
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_requests", "select `requests`.`uuid` AS `uuid`,`requests`.`internal_id` AS `internal_id`,`requests`.`request_type` AS `request_type`,`requests`.`fragment_size_from` AS `fragment_size_from`,`requests`.`fragment_size_to` AS `fragment_size_to`,`requests`.`read_length` AS `read_length`,`requests`.`library_type` AS `library_type`,`requests`.`study_uuid` AS `study_uuid`,`requests`.`study_internal_id` AS `study_internal_id`,`requests`.`study_name` AS `study_name`,`requests`.`project_uuid` AS `project_uuid`,`requests`.`project_internal_id` AS `project_internal_id`,`requests`.`project_name` AS `project_name`,`requests`.`source_asset_uuid` AS `source_asset_uuid`,`requests`.`source_asset_internal_id` AS `source_asset_internal_id`,`requests`.`source_asset_type` AS `source_asset_type`,`requests`.`source_asset_name` AS `source_asset_name`,`requests`.`source_asset_barcode` AS `source_asset_barcode`,`requests`.`source_asset_barcode_prefix` AS `source_asset_barcode_prefix`,`requests`.`source_asset_state` AS `source_asset_state`,`requests`.`source_asset_closed` AS `source_asset_closed`,`requests`.`source_asset_two_dimensional_barcode` AS `source_asset_two_dimensional_barcode`,`requests`.`source_asset_sample_uuid` AS `source_asset_sample_uuid`,`requests`.`source_asset_sample_internal_id` AS `source_asset_sample_internal_id`,`requests`.`target_asset_uuid` AS `target_asset_uuid`,`requests`.`target_asset_internal_id` AS `target_asset_internal_id`,`requests`.`target_asset_type` AS `target_asset_type`,`requests`.`target_asset_name` AS `target_asset_name`,`requests`.`target_asset_barcode` AS `target_asset_barcode`,`requests`.`target_asset_barcode_prefix` AS `target_asset_barcode_prefix`,`requests`.`target_asset_state` AS `target_asset_state`,`requests`.`target_asset_closed` AS `target_asset_closed`,`requests`.`target_asset_two_dimensional_barcode` AS `target_asset_two_dimensional_barcode`,`requests`.`target_asset_sample_uuid` AS `target_asset_sample_uuid`,`requests`.`target_asset_sample_internal_id` AS `target_asset_sample_internal_id`,`requests`.`is_current` AS `is_current`,`requests`.`checked_at` AS `checked_at`,`requests`.`last_updated` AS `last_updated`,`requests`.`created` AS `created`,`requests`.`state` AS `state`,`requests`.`priority` AS `priority`,`requests`.`user` AS `user`,`requests`.`inserted_at` AS `inserted_at`,`requests`.`deleted_at` AS `deleted_at`,`requests`.`submission_uuid` AS `submission_uuid`,`requests`.`submission_internal_id` AS `submission_internal_id`,`requests`.`current_from` AS `current_from`,`requests`.`current_to` AS `current_to` from `requests` where isnull(`requests`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :request_type
    v.column :fragment_size_from
    v.column :fragment_size_to
    v.column :read_length
    v.column :library_type
    v.column :study_uuid
    v.column :study_internal_id
    v.column :study_name
    v.column :project_uuid
    v.column :project_internal_id
    v.column :project_name
    v.column :source_asset_uuid
    v.column :source_asset_internal_id
    v.column :source_asset_type
    v.column :source_asset_name
    v.column :source_asset_barcode
    v.column :source_asset_barcode_prefix
    v.column :source_asset_state
    v.column :source_asset_closed
    v.column :source_asset_two_dimensional_barcode
    v.column :source_asset_sample_uuid
    v.column :source_asset_sample_internal_id
    v.column :target_asset_uuid
    v.column :target_asset_internal_id
    v.column :target_asset_type
    v.column :target_asset_name
    v.column :target_asset_barcode
    v.column :target_asset_barcode_prefix
    v.column :target_asset_state
    v.column :target_asset_closed
    v.column :target_asset_two_dimensional_barcode
    v.column :target_asset_sample_uuid
    v.column :target_asset_sample_internal_id
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :state
    v.column :priority
    v.column :user
    v.column :inserted_at
    v.column :deleted_at
    v.column :submission_uuid
    v.column :submission_internal_id
    v.column :current_from
    v.column :current_to
  end

  create_view "current_sample_tubes", "select `sample_tubes`.`uuid` AS `uuid`,`sample_tubes`.`internal_id` AS `internal_id`,`sample_tubes`.`name` AS `name`,`sample_tubes`.`barcode` AS `barcode`,`sample_tubes`.`closed` AS `closed`,`sample_tubes`.`state` AS `state`,`sample_tubes`.`two_dimensional_barcode` AS `two_dimensional_barcode`,`sample_tubes`.`sample_uuid` AS `sample_uuid`,`sample_tubes`.`sample_internal_id` AS `sample_internal_id`,`sample_tubes`.`sample_name` AS `sample_name`,`sample_tubes`.`scanned_in_date` AS `scanned_in_date`,`sample_tubes`.`volume` AS `volume`,`sample_tubes`.`concentration` AS `concentration`,`sample_tubes`.`is_current` AS `is_current`,`sample_tubes`.`checked_at` AS `checked_at`,`sample_tubes`.`last_updated` AS `last_updated`,`sample_tubes`.`created` AS `created`,`sample_tubes`.`barcode_prefix` AS `barcode_prefix`,`sample_tubes`.`inserted_at` AS `inserted_at`,`sample_tubes`.`deleted_at` AS `deleted_at`,`sample_tubes`.`current_from` AS `current_from`,`sample_tubes`.`current_to` AS `current_to` from `sample_tubes` where isnull(`sample_tubes`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :barcode
    v.column :closed
    v.column :state
    v.column :two_dimensional_barcode
    v.column :sample_uuid
    v.column :sample_internal_id
    v.column :sample_name
    v.column :scanned_in_date
    v.column :volume
    v.column :concentration
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :barcode_prefix
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_samples", "select `samples`.`uuid` AS `uuid`,`samples`.`internal_id` AS `internal_id`,`samples`.`name` AS `name`,`samples`.`reference_genome` AS `reference_genome`,`samples`.`organism` AS `organism`,`samples`.`accession_number` AS `accession_number`,`samples`.`common_name` AS `common_name`,`samples`.`description` AS `description`,`samples`.`taxon_id` AS `taxon_id`,`samples`.`father` AS `father`,`samples`.`mother` AS `mother`,`samples`.`replicate` AS `replicate`,`samples`.`ethnicity` AS `ethnicity`,`samples`.`gender` AS `gender`,`samples`.`cohort` AS `cohort`,`samples`.`country_of_origin` AS `country_of_origin`,`samples`.`geographical_region` AS `geographical_region`,`samples`.`is_current` AS `is_current`,`samples`.`checked_at` AS `checked_at`,`samples`.`last_updated` AS `last_updated`,`samples`.`created` AS `created`,`samples`.`sanger_sample_id` AS `sanger_sample_id`,`samples`.`control` AS `control`,`samples`.`empty_supplier_sample_name` AS `empty_supplier_sample_name`,`samples`.`supplier_name` AS `supplier_name`,`samples`.`public_name` AS `public_name`,`samples`.`sample_visibility` AS `sample_visibility`,`samples`.`strain` AS `strain`,`samples`.`updated_by_manifest` AS `updated_by_manifest`,`samples`.`inserted_at` AS `inserted_at`,`samples`.`deleted_at` AS `deleted_at`,`samples`.`current_from` AS `current_from`,`samples`.`current_to` AS `current_to` from `samples` where isnull(`samples`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :reference_genome
    v.column :organism
    v.column :accession_number
    v.column :common_name
    v.column :description
    v.column :taxon_id
    v.column :father
    v.column :mother
    v.column :replicate
    v.column :ethnicity
    v.column :gender
    v.column :cohort
    v.column :country_of_origin
    v.column :geographical_region
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :sanger_sample_id
    v.column :control
    v.column :empty_supplier_sample_name
    v.column :supplier_name
    v.column :public_name
    v.column :sample_visibility
    v.column :strain
    v.column :updated_by_manifest
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_studies", "select `studies`.`uuid` AS `uuid`,`studies`.`internal_id` AS `internal_id`,`studies`.`name` AS `name`,`studies`.`reference_genome` AS `reference_genome`,`studies`.`ethically_approved` AS `ethically_approved`,`studies`.`faculty_sponsor` AS `faculty_sponsor`,`studies`.`state` AS `state`,`studies`.`study_type` AS `study_type`,`studies`.`abstract` AS `abstract`,`studies`.`abbreviation` AS `abbreviation`,`studies`.`accession_number` AS `accession_number`,`studies`.`description` AS `description`,`studies`.`is_current` AS `is_current`,`studies`.`checked_at` AS `checked_at`,`studies`.`last_updated` AS `last_updated`,`studies`.`created` AS `created`,`studies`.`contains_human_dna` AS `contains_human_dna`,`studies`.`contaminated_human_dna` AS `contaminated_human_dna`,`studies`.`data_release_strategy` AS `data_release_strategy`,`studies`.`data_release_sort_of_study` AS `data_release_sort_of_study`,`studies`.`ena_project_id` AS `ena_project_id`,`studies`.`study_title` AS `study_title`,`studies`.`study_visibility` AS `study_visibility`,`studies`.`ega_dac_accession_number` AS `ega_dac_accession_number`,`studies`.`array_express_accession_number` AS `array_express_accession_number`,`studies`.`ega_policy_accession_number` AS `ega_policy_accession_number`,`studies`.`inserted_at` AS `inserted_at`,`studies`.`deleted_at` AS `deleted_at`,`studies`.`current_from` AS `current_from`,`studies`.`current_to` AS `current_to` from `studies` where isnull(`studies`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :reference_genome
    v.column :ethically_approved
    v.column :faculty_sponsor
    v.column :state
    v.column :study_type
    v.column :abstract
    v.column :abbreviation
    v.column :accession_number
    v.column :description
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :contains_human_dna
    v.column :contaminated_human_dna
    v.column :data_release_strategy
    v.column :data_release_sort_of_study
    v.column :ena_project_id
    v.column :study_title
    v.column :study_visibility
    v.column :ega_dac_accession_number
    v.column :array_express_accession_number
    v.column :ega_policy_accession_number
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_study_samples", "select `study_samples`.`uuid` AS `uuid`,`study_samples`.`internal_id` AS `internal_id`,`study_samples`.`sample_internal_id` AS `sample_internal_id`,`study_samples`.`sample_uuid` AS `sample_uuid`,`study_samples`.`study_internal_id` AS `study_internal_id`,`study_samples`.`study_uuid` AS `study_uuid`,`study_samples`.`is_current` AS `is_current`,`study_samples`.`checked_at` AS `checked_at`,`study_samples`.`last_updated` AS `last_updated`,`study_samples`.`created` AS `created`,`study_samples`.`inserted_at` AS `inserted_at`,`study_samples`.`deleted_at` AS `deleted_at`,`study_samples`.`current_from` AS `current_from`,`study_samples`.`current_to` AS `current_to` from `study_samples` where isnull(`study_samples`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :sample_internal_id
    v.column :sample_uuid
    v.column :study_internal_id
    v.column :study_uuid
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_submissions", "select `submissions`.`uuid` AS `uuid`,`submissions`.`internal_id` AS `internal_id`,`submissions`.`is_current` AS `is_current`,`submissions`.`checked_at` AS `checked_at`,`submissions`.`last_updated` AS `last_updated`,`submissions`.`created` AS `created`,`submissions`.`created_by` AS `created_by`,`submissions`.`state` AS `state`,`submissions`.`message` AS `message`,`submissions`.`inserted_at` AS `inserted_at`,`submissions`.`deleted_at` AS `deleted_at`,`submissions`.`current_from` AS `current_from`,`submissions`.`current_to` AS `current_to` from `submissions` where isnull(`submissions`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :created_by
    v.column :state
    v.column :message
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_tags", "select `tags`.`uuid` AS `uuid`,`tags`.`internal_id` AS `internal_id`,`tags`.`expected_sequence` AS `expected_sequence`,`tags`.`map_id` AS `map_id`,`tags`.`tag_group_name` AS `tag_group_name`,`tags`.`tag_group_uuid` AS `tag_group_uuid`,`tags`.`tag_group_internal_id` AS `tag_group_internal_id`,`tags`.`is_current` AS `is_current`,`tags`.`checked_at` AS `checked_at`,`tags`.`last_updated` AS `last_updated`,`tags`.`created` AS `created`,`tags`.`inserted_at` AS `inserted_at`,`tags`.`deleted_at` AS `deleted_at`,`tags`.`current_from` AS `current_from`,`tags`.`current_to` AS `current_to` from `tags` where isnull(`tags`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :expected_sequence
    v.column :map_id
    v.column :tag_group_name
    v.column :tag_group_uuid
    v.column :tag_group_internal_id
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "current_wells", "select `wells`.`uuid` AS `uuid`,`wells`.`internal_id` AS `internal_id`,`wells`.`name` AS `name`,`wells`.`map` AS `map`,`wells`.`plate_barcode` AS `plate_barcode`,`wells`.`plate_barcode_prefix` AS `plate_barcode_prefix`,`wells`.`sample_uuid` AS `sample_uuid`,`wells`.`sample_internal_id` AS `sample_internal_id`,`wells`.`sample_name` AS `sample_name`,`wells`.`gel_pass` AS `gel_pass`,`wells`.`concentration` AS `concentration`,`wells`.`current_volume` AS `current_volume`,`wells`.`buffer_volume` AS `buffer_volume`,`wells`.`requested_volume` AS `requested_volume`,`wells`.`picked_volume` AS `picked_volume`,`wells`.`pico_pass` AS `pico_pass`,`wells`.`is_current` AS `is_current`,`wells`.`checked_at` AS `checked_at`,`wells`.`last_updated` AS `last_updated`,`wells`.`created` AS `created`,`wells`.`plate_uuid` AS `plate_uuid`,`wells`.`measured_volume` AS `measured_volume`,`wells`.`sequenom_count` AS `sequenom_count`,`wells`.`gender_markers` AS `gender_markers`,`wells`.`genotyping_status` AS `genotyping_status`,`wells`.`genotyping_snp_plate_id` AS `genotyping_snp_plate_id`,`wells`.`inserted_at` AS `inserted_at`,`wells`.`deleted_at` AS `deleted_at`,`wells`.`current_from` AS `current_from`,`wells`.`current_to` AS `current_to` from `wells` where isnull(`wells`.`current_to`)", :force => true do |v|
    v.column :uuid
    v.column :internal_id
    v.column :name
    v.column :map
    v.column :plate_barcode
    v.column :plate_barcode_prefix
    v.column :sample_uuid
    v.column :sample_internal_id
    v.column :sample_name
    v.column :gel_pass
    v.column :concentration
    v.column :current_volume
    v.column :buffer_volume
    v.column :requested_volume
    v.column :picked_volume
    v.column :pico_pass
    v.column :is_current
    v.column :checked_at
    v.column :last_updated
    v.column :created
    v.column :plate_uuid
    v.column :measured_volume
    v.column :sequenom_count
    v.column :gender_markers
    v.column :genotyping_status
    v.column :genotyping_snp_plate_id
    v.column :inserted_at
    v.column :deleted_at
    v.column :current_from
    v.column :current_to
  end

  create_view "uuid_objects", "(select `aliquots`.`uuid` AS `uuid`,hex(`aliquots`.`uuid`) AS `decoded_uuid`,`aliquots`.`checked_at` AS `object_name`,`aliquots`.`last_updated` AS `internal_id`,`aliquots`.`created` AS `name`,0 AS `checked_at`,NULL AS `created`,NULL AS `last_updated`,'aliquots' AS `deleted` from `aliquots` where ((`aliquots`.`is_current` = 1) and (`aliquots`.`uuid` is not null))) union (select `asset_audits`.`uuid` AS `uuid`,hex(`asset_audits`.`uuid`) AS `decoded_uuid`,`asset_audits`.`checked_at` AS `checked_at`,`asset_audits`.`last_updated` AS `last_updated`,`asset_audits`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'asset_audits' AS `object_name` from `asset_audits` where ((`asset_audits`.`is_current` = 1) and (`asset_audits`.`uuid` is not null))) union (select `asset_freezers`.`uuid` AS `uuid`,hex(`asset_freezers`.`uuid`) AS `decoded_uuid`,`asset_freezers`.`checked_at` AS `checked_at`,`asset_freezers`.`last_updated` AS `last_updated`,`asset_freezers`.`created` AS `created`,0 AS `deleted`,`asset_freezers`.`name` AS `name`,NULL AS `internal_id`,'asset_freezers' AS `object_name` from `asset_freezers` where ((`asset_freezers`.`is_current` = 1) and (`asset_freezers`.`uuid` is not null))) union (select `asset_links`.`uuid` AS `uuid`,hex(`asset_links`.`uuid`) AS `decoded_uuid`,`asset_links`.`checked_at` AS `checked_at`,`asset_links`.`last_updated` AS `last_updated`,`asset_links`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'asset_links' AS `object_name` from `asset_links` where ((`asset_links`.`is_current` = 1) and (`asset_links`.`uuid` is not null))) union (select `batch_requests`.`uuid` AS `uuid`,hex(`batch_requests`.`uuid`) AS `decoded_uuid`,`batch_requests`.`checked_at` AS `checked_at`,`batch_requests`.`last_updated` AS `last_updated`,`batch_requests`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'batch_requests' AS `object_name` from `batch_requests` where ((`batch_requests`.`is_current` = 1) and (`batch_requests`.`uuid` is not null))) union (select `batches`.`uuid` AS `uuid`,hex(`batches`.`uuid`) AS `decoded_uuid`,`batches`.`checked_at` AS `checked_at`,`batches`.`last_updated` AS `last_updated`,`batches`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'batches' AS `object_name` from `batches` where ((`batches`.`is_current` = 1) and (`batches`.`uuid` is not null))) union (select `billing_events`.`uuid` AS `uuid`,hex(`billing_events`.`uuid`) AS `decoded_uuid`,`billing_events`.`checked_at` AS `checked_at`,`billing_events`.`last_updated` AS `last_updated`,`billing_events`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'billing_events' AS `object_name` from `billing_events` where ((`billing_events`.`is_current` = 1) and (`billing_events`.`uuid` is not null))) union (select `events`.`uuid` AS `uuid`,hex(`events`.`uuid`) AS `decoded_uuid`,`events`.`checked_at` AS `checked_at`,`events`.`last_updated` AS `last_updated`,`events`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'events' AS `object_name` from `events` where ((`events`.`is_current` = 1) and (`events`.`uuid` is not null))) union (select `lanes`.`uuid` AS `uuid`,hex(`lanes`.`uuid`) AS `decoded_uuid`,`lanes`.`checked_at` AS `checked_at`,`lanes`.`last_updated` AS `last_updated`,`lanes`.`created` AS `created`,0 AS `deleted`,`lanes`.`name` AS `name`,`lanes`.`internal_id` AS `internal_id`,'lanes' AS `object_name` from `lanes` where ((`lanes`.`is_current` = 1) and (`lanes`.`uuid` is not null))) union (select `library_tubes`.`uuid` AS `uuid`,hex(`library_tubes`.`uuid`) AS `decoded_uuid`,`library_tubes`.`checked_at` AS `checked_at`,`library_tubes`.`last_updated` AS `last_updated`,`library_tubes`.`created` AS `created`,0 AS `deleted`,`library_tubes`.`name` AS `name`,`library_tubes`.`internal_id` AS `internal_id`,'library_tubes' AS `object_name` from `library_tubes` where ((`library_tubes`.`is_current` = 1) and (`library_tubes`.`uuid` is not null))) union (select `multiplexed_library_tubes`.`uuid` AS `uuid`,hex(`multiplexed_library_tubes`.`uuid`) AS `decoded_uuid`,`multiplexed_library_tubes`.`checked_at` AS `checked_at`,`multiplexed_library_tubes`.`last_updated` AS `last_updated`,`multiplexed_library_tubes`.`created` AS `created`,0 AS `deleted`,`multiplexed_library_tubes`.`name` AS `name`,`multiplexed_library_tubes`.`internal_id` AS `internal_id`,'multiplexed_library_tubes' AS `object_name` from `multiplexed_library_tubes` where ((`multiplexed_library_tubes`.`is_current` = 1) and (`multiplexed_library_tubes`.`uuid` is not null))) union (select `plate_purposes`.`uuid` AS `uuid`,hex(`plate_purposes`.`uuid`) AS `decoded_uuid`,`plate_purposes`.`checked_at` AS `checked_at`,`plate_purposes`.`last_updated` AS `last_updated`,`plate_purposes`.`created` AS `created`,0 AS `deleted`,`plate_purposes`.`name` AS `name`,NULL AS `internal_id`,'plate_purposes' AS `object_name` from `plate_purposes` where ((`plate_purposes`.`is_current` = 1) and (`plate_purposes`.`uuid` is not null))) union (select `plates`.`uuid` AS `uuid`,hex(`plates`.`uuid`) AS `decoded_uuid`,`plates`.`checked_at` AS `checked_at`,`plates`.`last_updated` AS `last_updated`,`plates`.`created` AS `created`,0 AS `deleted`,`plates`.`name` AS `name`,`plates`.`internal_id` AS `internal_id`,'plates' AS `object_name` from `plates` where ((`plates`.`is_current` = 1) and (`plates`.`uuid` is not null))) union (select `projects`.`uuid` AS `uuid`,hex(`projects`.`uuid`) AS `decoded_uuid`,`projects`.`checked_at` AS `checked_at`,`projects`.`last_updated` AS `last_updated`,`projects`.`created` AS `created`,0 AS `deleted`,`projects`.`name` AS `name`,`projects`.`internal_id` AS `internal_id`,'projects' AS `object_name` from `projects` where ((`projects`.`is_current` = 1) and (`projects`.`uuid` is not null))) union (select `quotas`.`uuid` AS `uuid`,hex(`quotas`.`uuid`) AS `decoded_uuid`,`quotas`.`checked_at` AS `checked_at`,`quotas`.`last_updated` AS `last_updated`,`quotas`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'quotas' AS `object_name` from `quotas` where ((`quotas`.`is_current` = 1) and (`quotas`.`uuid` is not null))) union (select `requests`.`uuid` AS `uuid`,hex(`requests`.`uuid`) AS `decoded_uuid`,`requests`.`checked_at` AS `checked_at`,`requests`.`last_updated` AS `last_updated`,`requests`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,`requests`.`internal_id` AS `internal_id`,'requests' AS `object_name` from `requests` where ((`requests`.`is_current` = 1) and (`requests`.`uuid` is not null))) union (select `sample_tubes`.`uuid` AS `uuid`,hex(`sample_tubes`.`uuid`) AS `decoded_uuid`,`sample_tubes`.`checked_at` AS `checked_at`,`sample_tubes`.`last_updated` AS `last_updated`,`sample_tubes`.`created` AS `created`,0 AS `deleted`,`sample_tubes`.`name` AS `name`,`sample_tubes`.`internal_id` AS `internal_id`,'sample_tubes' AS `object_name` from `sample_tubes` where ((`sample_tubes`.`is_current` = 1) and (`sample_tubes`.`uuid` is not null))) union (select `samples`.`uuid` AS `uuid`,hex(`samples`.`uuid`) AS `decoded_uuid`,`samples`.`checked_at` AS `checked_at`,`samples`.`last_updated` AS `last_updated`,`samples`.`created` AS `created`,0 AS `deleted`,`samples`.`name` AS `name`,`samples`.`internal_id` AS `internal_id`,'samples' AS `object_name` from `samples` where ((`samples`.`is_current` = 1) and (`samples`.`uuid` is not null))) union (select `studies`.`uuid` AS `uuid`,hex(`studies`.`uuid`) AS `decoded_uuid`,`studies`.`checked_at` AS `checked_at`,`studies`.`last_updated` AS `last_updated`,`studies`.`created` AS `created`,0 AS `deleted`,`studies`.`name` AS `name`,`studies`.`internal_id` AS `internal_id`,'studies' AS `object_name` from `studies` where ((`studies`.`is_current` = 1) and (`studies`.`uuid` is not null))) union (select `submissions`.`uuid` AS `uuid`,hex(`submissions`.`uuid`) AS `decoded_uuid`,`submissions`.`checked_at` AS `checked_at`,`submissions`.`last_updated` AS `last_updated`,`submissions`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,`submissions`.`internal_id` AS `internal_id`,'submissions' AS `object_name` from `submissions` where ((`submissions`.`is_current` = 1) and (`submissions`.`uuid` is not null))) union (select `tags`.`uuid` AS `uuid`,hex(`tags`.`uuid`) AS `decoded_uuid`,`tags`.`checked_at` AS `checked_at`,`tags`.`last_updated` AS `last_updated`,`tags`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'tags' AS `object_name` from `tags` where ((`tags`.`is_current` = 1) and (`tags`.`uuid` is not null))) union (select `wells`.`uuid` AS `uuid`,hex(`wells`.`uuid`) AS `decoded_uuid`,`wells`.`checked_at` AS `checked_at`,`wells`.`last_updated` AS `last_updated`,`wells`.`created` AS `created`,0 AS `deleted`,`wells`.`name` AS `name`,`wells`.`internal_id` AS `internal_id`,'wells' AS `object_name` from `wells` where ((`wells`.`is_current` = 1) and (`wells`.`uuid` is not null)))", :force => true do |v|
    v.column :uuid
    v.column :decoded_uuid
    v.column :object_name
    v.column :internal_id
    v.column :name
    v.column :checked_at
    v.column :created
    v.column :last_updated
    v.column :deleted
  end

end
