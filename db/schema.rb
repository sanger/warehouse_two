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

ActiveRecord::Schema.define(:version => 20111123110814) do

  create_table "aliquots", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                   :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "receptacle_uuid",        :limit => 36
    t.integer  "receptacle_internal_id"
    t.string   "study_uuid",             :limit => 36
    t.integer  "study_internal_id"
    t.string   "project_uuid",           :limit => 36
    t.integer  "project_internal_id"
    t.string   "library_uuid",           :limit => 36
    t.integer  "library_internal_id"
    t.string   "sample_uuid",            :limit => 36
    t.integer  "sample_internal_id"
    t.string   "tag_uuid",               :limit => 36
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

  add_index "aliquots", ["created"], :name => "index_aliquots_on_created"
  add_index "aliquots", ["internal_id"], :name => "index_aliquots_on_internal_id"
  add_index "aliquots", ["last_updated"], :name => "index_aliquots_on_last_updated"
  add_index "aliquots", ["uuid"], :name => "index_aliquots_on_uuid"

  create_table "asset_audits", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                 :limit => 36, :null => false
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
    t.string   "asset_uuid",           :limit => 36
    t.string   "witnessed_by"
    t.datetime "inserted_at"
  end

  add_index "asset_audits", ["asset_barcode"], :name => "index_asset_audits_on_asset_barcode"
  add_index "asset_audits", ["asset_uuid"], :name => "index_asset_audits_on_asset_uuid"
  add_index "asset_audits", ["created"], :name => "index_asset_audits_on_created"
  add_index "asset_audits", ["created_by"], :name => "index_asset_audits_on_created_by"
  add_index "asset_audits", ["internal_id"], :name => "index_asset_audits_on_internal_id"
  add_index "asset_audits", ["key"], :name => "index_asset_audits_on_key"
  add_index "asset_audits", ["last_updated"], :name => "index_asset_audits_on_last_updated"
  add_index "asset_audits", ["uuid"], :name => "index_asset_audits_on_uuid"

  create_table "asset_freezers", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",           :limit => 36, :null => false
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

  add_index "asset_freezers", ["asset_type"], :name => "index_asset_freezers_on_asset_type"
  add_index "asset_freezers", ["barcode"], :name => "index_asset_freezers_on_barcode"
  add_index "asset_freezers", ["barcode_prefix"], :name => "index_asset_freezers_on_barcode_prefix"
  add_index "asset_freezers", ["building"], :name => "index_asset_freezers_on_building"
  add_index "asset_freezers", ["checked_at"], :name => "index_asset_freezers_on_checked_at"
  add_index "asset_freezers", ["created"], :name => "index_asset_freezers_on_created"
  add_index "asset_freezers", ["freezer"], :name => "index_asset_freezers_on_freezer"
  add_index "asset_freezers", ["internal_id"], :name => "index_asset_freezers_on_internal_id"
  add_index "asset_freezers", ["is_current"], :name => "index_asset_freezers_on_is_current"
  add_index "asset_freezers", ["last_updated"], :name => "index_asset_freezers_on_last_updated"
  add_index "asset_freezers", ["name"], :name => "index_asset_freezers_on_name"
  add_index "asset_freezers", ["room"], :name => "index_asset_freezers_on_room"
  add_index "asset_freezers", ["shelf"], :name => "index_asset_freezers_on_shelf"
  add_index "asset_freezers", ["uuid"], :name => "index_asset_freezers_on_uuid"

  create_table "asset_links", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                   :limit => 36
    t.string   "ancestor_uuid",          :limit => 36
    t.integer  "ancestor_internal_id"
    t.string   "ancestor_type"
    t.string   "descendant_uuid",        :limit => 36
    t.integer  "descendant_internal_id"
    t.string   "descendant_type"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "asset_links", ["ancestor_internal_id"], :name => "index_asset_links_on_ancestor_internal_id"
  add_index "asset_links", ["ancestor_uuid"], :name => "index_asset_links_on_ancestor_uuid"
  add_index "asset_links", ["checked_at"], :name => "index_asset_links_on_checked_at"
  add_index "asset_links", ["created"], :name => "index_asset_links_on_created"
  add_index "asset_links", ["descendant_internal_id"], :name => "index_asset_links_on_descendant_internal_id"
  add_index "asset_links", ["descendant_uuid"], :name => "index_asset_links_on_descendant_uuid"
  add_index "asset_links", ["last_updated"], :name => "index_asset_links_on_last_updated"
  add_index "asset_links", ["uuid"], :name => "index_asset_links_on_uuid"

  create_table "batch_requests", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                     :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "batch_uuid",               :limit => 36
    t.integer  "batch_internal_id"
    t.string   "request_uuid",             :limit => 36
    t.integer  "request_internal_id"
    t.string   "request_type"
    t.string   "source_asset_uuid",        :limit => 36
    t.integer  "source_asset_internal_id"
    t.string   "source_asset_name"
    t.string   "target_asset_uuid",        :limit => 36
    t.integer  "target_asset_internal_id"
    t.string   "target_asset_name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "batch_requests", ["batch_internal_id"], :name => "index_batch_requests_on_batch_internal_id"
  add_index "batch_requests", ["batch_uuid"], :name => "index_batch_requests_on_batch_uuid"
  add_index "batch_requests", ["checked_at"], :name => "index_batch_requests_on_checked_at"
  add_index "batch_requests", ["created"], :name => "index_batch_requests_on_created"
  add_index "batch_requests", ["internal_id"], :name => "index_batch_requests_on_internal_id"
  add_index "batch_requests", ["is_current"], :name => "index_batch_requests_on_is_current"
  add_index "batch_requests", ["last_updated"], :name => "index_batch_requests_on_last_updated"
  add_index "batch_requests", ["request_internal_id"], :name => "index_batch_requests_on_request_internal_id"
  add_index "batch_requests", ["request_type"], :name => "index_batch_requests_on_request_type"
  add_index "batch_requests", ["request_uuid"], :name => "index_batch_requests_on_request_uuid"
  add_index "batch_requests", ["source_asset_internal_id"], :name => "index_batch_requests_on_source_asset_internal_id"
  add_index "batch_requests", ["source_asset_name"], :name => "index_batch_requests_on_source_asset_name"
  add_index "batch_requests", ["source_asset_uuid"], :name => "index_batch_requests_on_source_asset_uuid"
  add_index "batch_requests", ["target_asset_internal_id"], :name => "index_batch_requests_on_target_asset_internal_id"
  add_index "batch_requests", ["target_asset_name"], :name => "index_batch_requests_on_target_asset_name"
  add_index "batch_requests", ["target_asset_uuid"], :name => "index_batch_requests_on_target_asset_uuid"
  add_index "batch_requests", ["uuid"], :name => "index_batch_requests_on_uuid"

  create_table "batches", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                 :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "created_by",           :limit => 30
    t.string   "assigned_to",          :limit => 30
    t.string   "pipeline_name"
    t.string   "pipeline_uuid",        :limit => 36
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

  add_index "batches", ["assigned_to"], :name => "index_batches_on_assigned_to"
  add_index "batches", ["checked_at"], :name => "index_batches_on_checked_at"
  add_index "batches", ["created"], :name => "index_batches_on_created"
  add_index "batches", ["created_by"], :name => "index_batches_on_created_by"
  add_index "batches", ["internal_id"], :name => "index_batches_on_internal_id"
  add_index "batches", ["is_current"], :name => "index_batches_on_is_current"
  add_index "batches", ["last_updated"], :name => "index_batches_on_last_updated"
  add_index "batches", ["pipeline_internal_id"], :name => "index_batches_on_pipeline_internal_id"
  add_index "batches", ["pipeline_name"], :name => "index_batches_on_pipeline_name"
  add_index "batches", ["pipeline_uuid"], :name => "index_batches_on_pipeline_uuid"
  add_index "batches", ["production_state"], :name => "index_batches_on_production_state"
  add_index "batches", ["qc_state"], :name => "index_batches_on_qc_state"
  add_index "batches", ["state"], :name => "index_batches_on_state"
  add_index "batches", ["uuid"], :name => "index_batches_on_uuid"

  create_table "billing_events", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "reference"
    t.integer  "project_internal_id"
    t.string   "project_uuid",        :limit => 36
    t.string   "project_name"
    t.string   "division"
    t.string   "created_by"
    t.integer  "request_internal_id"
    t.string   "request_uuid",        :limit => 36
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

  add_index "billing_events", ["checked_at"], :name => "index_billing_events_on_checked_at"
  add_index "billing_events", ["cost_code"], :name => "index_billing_events_on_cost_code"
  add_index "billing_events", ["created"], :name => "index_billing_events_on_created"
  add_index "billing_events", ["created_by"], :name => "index_billing_events_on_created_by"
  add_index "billing_events", ["description"], :name => "index_billing_events_on_description"
  add_index "billing_events", ["division"], :name => "index_billing_events_on_division"
  add_index "billing_events", ["entry_date"], :name => "index_billing_events_on_entry_date"
  add_index "billing_events", ["internal_id"], :name => "index_billing_events_on_internal_id"
  add_index "billing_events", ["is_current"], :name => "index_billing_events_on_is_current"
  add_index "billing_events", ["kind"], :name => "index_billing_events_on_kind"
  add_index "billing_events", ["last_updated"], :name => "index_billing_events_on_last_updated"
  add_index "billing_events", ["library_type"], :name => "index_billing_events_on_library_type"
  add_index "billing_events", ["price"], :name => "index_billing_events_on_price"
  add_index "billing_events", ["project_internal_id"], :name => "index_billing_events_on_project_internal_id"
  add_index "billing_events", ["project_name"], :name => "index_billing_events_on_project_name"
  add_index "billing_events", ["project_uuid"], :name => "index_billing_events_on_project_uuid"
  add_index "billing_events", ["quantity"], :name => "index_billing_events_on_quantity"
  add_index "billing_events", ["reference"], :name => "index_billing_events_on_reference"
  add_index "billing_events", ["request_internal_id"], :name => "index_billing_events_on_request_internal_id"
  add_index "billing_events", ["request_type"], :name => "index_billing_events_on_request_type"
  add_index "billing_events", ["request_uuid"], :name => "index_billing_events_on_request_uuid"
  add_index "billing_events", ["uuid"], :name => "index_billing_events_on_uuid"

  create_table "current_asset_audits", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                        :default => 0, :null => false
    t.string   "uuid",                 :limit => 36,                :null => false
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
    t.string   "asset_uuid",           :limit => 36
    t.string   "witnessed_by"
    t.datetime "inserted_at"
  end

  create_table "current_asset_freezers", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                  :default => 0, :null => false
    t.string   "uuid",           :limit => 36,                :null => false
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

  create_table "current_asset_links", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                          :default => 0, :null => false
    t.string   "uuid",                   :limit => 36
    t.string   "ancestor_uuid",          :limit => 36
    t.integer  "ancestor_internal_id"
    t.string   "ancestor_type"
    t.string   "descendant_uuid",        :limit => 36
    t.integer  "descendant_internal_id"
    t.string   "descendant_type"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_batch_requests", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                            :default => 0, :null => false
    t.string   "uuid",                     :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "batch_uuid",               :limit => 36
    t.integer  "batch_internal_id"
    t.string   "request_uuid",             :limit => 36
    t.integer  "request_internal_id"
    t.string   "request_type"
    t.string   "source_asset_uuid",        :limit => 36
    t.integer  "source_asset_internal_id"
    t.string   "source_asset_name"
    t.string   "target_asset_uuid",        :limit => 36
    t.integer  "target_asset_internal_id"
    t.string   "target_asset_name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_batches", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                        :default => 0, :null => false
    t.string   "uuid",                 :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "created_by",           :limit => 30
    t.string   "assigned_to",          :limit => 30
    t.string   "pipeline_name"
    t.string   "pipeline_uuid",        :limit => 36
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

  create_table "current_billing_events", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                       :default => 0, :null => false
    t.string   "uuid",                :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "reference"
    t.integer  "project_internal_id"
    t.string   "project_uuid",        :limit => 36
    t.string   "project_name"
    t.string   "division"
    t.string   "created_by"
    t.integer  "request_internal_id"
    t.string   "request_uuid",        :limit => 36
    t.string   "request_type"
    t.string   "library_type"
    t.string   "cost_code"
    t.integer  "price"
    t.integer  "quantity"
    t.string   "kind"
    t.string   "description"
    t.boolean  "is_current"
    t.datetime "entry_date"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_events", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                      :default => 0, :null => false
    t.string   "uuid",               :limit => 36,                :null => false
    t.integer  "internal_id"
    t.integer  "source_internal_id"
    t.string   "source_uuid",        :limit => 36
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

  create_table "current_lanes", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                           :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                :null => false
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

  create_table "current_library_tubes", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                                             :default => 0, :null => false
    t.string   "uuid",                        :limit => 36,                                              :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",              :limit => 2
    t.boolean  "closed"
    t.string   "state",                       :limit => 50
    t.string   "two_dimensional_barcode"
    t.string   "sample_uuid",                 :limit => 36
    t.integer  "sample_internal_id"
    t.decimal  "volume",                                    :precision => 5, :scale => 2
    t.decimal  "concentration",                             :precision => 5, :scale => 2
    t.string   "tag_uuid",                    :limit => 36
    t.integer  "tag_internal_id"
    t.string   "expected_sequence"
    t.integer  "tag_map_id"
    t.string   "tag_group_name"
    t.string   "tag_group_uuid",              :limit => 36
    t.integer  "tag_group_internal_id"
    t.integer  "source_request_internal_id"
    t.string   "source_request_uuid",         :limit => 36
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

  create_table "current_multiplexed_library_tubes", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                                         :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                                              :null => false
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
  end

  create_table "current_plate_purposes", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                :default => 0, :null => false
    t.string   "uuid",         :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_plates", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                             :default => 0, :null => false
    t.string   "uuid",                      :limit => 36,                :null => false
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
    t.string   "plate_purpose_uuid",        :limit => 36
    t.string   "infinium_barcode"
    t.string   "location"
    t.datetime "inserted_at"
  end

  create_table "current_projects", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                           :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                :null => false
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

  create_table "current_pulldown_multiplexed_library_tubes", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                                         :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                                              :null => false
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

  create_table "current_quotas", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                       :default => 0, :null => false
    t.string   "uuid",                :limit => 36,                :null => false
    t.integer  "internal_id"
    t.integer  "quota_limit"
    t.string   "request_type"
    t.integer  "project_internal_id"
    t.string   "project_uuid",        :limit => 36
    t.string   "project_name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_requests", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                        :default => 0, :null => false
    t.string   "uuid",                                 :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "request_type"
    t.string   "fragment_size_from"
    t.string   "fragment_size_to"
    t.integer  "read_length"
    t.string   "library_type"
    t.string   "study_uuid",                           :limit => 36
    t.integer  "study_internal_id"
    t.string   "study_name"
    t.string   "project_uuid",                         :limit => 36
    t.integer  "project_internal_id"
    t.string   "project_name"
    t.string   "source_asset_uuid",                    :limit => 36
    t.integer  "source_asset_internal_id"
    t.string   "source_asset_type",                    :limit => 50
    t.string   "source_asset_name"
    t.string   "source_asset_barcode"
    t.string   "source_asset_barcode_prefix"
    t.string   "source_asset_state"
    t.string   "source_asset_closed"
    t.string   "source_asset_two_dimensional_barcode"
    t.string   "source_asset_sample_uuid",             :limit => 36
    t.integer  "source_asset_sample_internal_id"
    t.string   "target_asset_uuid",                    :limit => 36
    t.integer  "target_asset_internal_id"
    t.string   "target_asset_type",                    :limit => 50
    t.string   "target_asset_name"
    t.string   "target_asset_barcode"
    t.string   "target_asset_barcode_prefix"
    t.string   "target_asset_state"
    t.string   "target_asset_closed"
    t.string   "target_asset_two_dimensional_barcode"
    t.string   "target_asset_sample_uuid",             :limit => 36
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

  create_table "current_sample_tubes", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                                         :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                                              :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.string   "sample_uuid",             :limit => 36
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

  create_table "current_samples", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                              :default => 0, :null => false
    t.string   "uuid",                       :limit => 36,                :null => false
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

  create_table "current_studies", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                  :default => 0, :null => false
    t.string   "uuid",                           :limit => 36,                :null => false
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

  create_table "current_study_samples", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                      :default => 0, :null => false
    t.string   "uuid",               :limit => 36
    t.integer  "internal_id"
    t.integer  "sample_internal_id"
    t.string   "sample_uuid",        :limit => 36
    t.integer  "study_internal_id"
    t.string   "study_uuid",         :limit => 36
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_submissions", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                               :default => 0, :null => false
    t.string   "uuid",                        :limit => 36,                :null => false
    t.integer  "internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "created_by"
    t.string   "template_name"
    t.string   "state"
    t.string   "study_name"
    t.string   "study_uuid",                  :limit => 36
    t.string   "project_name"
    t.string   "project_uuid",                :limit => 36
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

  create_table "current_tag_instances", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                           :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.string   "two_dimensional_barcode"
    t.string   "tag_uuid",                :limit => 36
    t.integer  "tag_internal_id"
    t.string   "tag_expected_sequence"
    t.integer  "tag_map_id"
    t.string   "tag_group_name"
    t.string   "tag_group_uuid",          :limit => 36
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_tags", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                         :default => 0, :null => false
    t.string   "uuid",                  :limit => 36,                :null => false
    t.integer  "internal_id"
    t.string   "expected_sequence"
    t.integer  "map_id"
    t.string   "tag_group_name"
    t.string   "tag_group_uuid",        :limit => 36
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  create_table "current_wells", :id => false, :force => true do |t|
    t.integer  "dont_use_id",                                                         :default => 0, :null => false
    t.string   "uuid",                    :limit => 36,                                              :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "map",                     :limit => 5
    t.string   "plate_barcode"
    t.string   "plate_barcode_prefix",    :limit => 2
    t.string   "sample_uuid",             :limit => 36
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
    t.string   "plate_uuid",              :limit => 36
    t.decimal  "measured_volume",                       :precision => 5, :scale => 2
    t.integer  "sequenom_count"
    t.string   "gender_markers",          :limit => 40
    t.string   "genotyping_status"
    t.string   "genotyping_snp_plate_id"
    t.datetime "inserted_at"
  end

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
    t.string   "uuid",               :limit => 36, :null => false
    t.integer  "internal_id"
    t.integer  "source_internal_id"
    t.string   "source_uuid",        :limit => 36
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

  add_index "events", ["actioned"], :name => "index_events_on_actioned"
  add_index "events", ["checked_at"], :name => "index_events_on_checked_at"
  add_index "events", ["created"], :name => "index_events_on_created"
  add_index "events", ["created_by"], :name => "index_events_on_created_by"
  add_index "events", ["descriptor_key"], :name => "index_events_on_descriptor_key"
  add_index "events", ["identifier"], :name => "index_events_on_identifier"
  add_index "events", ["internal_id"], :name => "index_events_on_internal_id"
  add_index "events", ["is_current"], :name => "index_events_on_is_current"
  add_index "events", ["last_updated"], :name => "index_events_on_last_updated"
  add_index "events", ["location"], :name => "index_events_on_location"
  add_index "events", ["message"], :name => "index_events_on_message"
  add_index "events", ["of_interest_to"], :name => "index_events_on_of_interest_to"
  add_index "events", ["source_internal_id"], :name => "index_events_on_source_internal_id"
  add_index "events", ["source_type"], :name => "index_events_on_source_type"
  add_index "events", ["source_uuid"], :name => "index_events_on_source_uuid"
  add_index "events", ["state"], :name => "index_events_on_state"
  add_index "events", ["uuid"], :name => "index_events_on_uuid"

  create_table "lane_allocation", :id => false, :force => true do |t|
    t.text     "cost_code",                              :null => false
    t.text     "budget_division",                        :null => false
    t.integer  "library_tubes",             :limit => 2
    t.integer  "multiplexed_library_tubes", :limit => 2
    t.integer  "37",                        :limit => 2
    t.integer  "54",                        :limit => 2
    t.integer  "76",                        :limit => 2
    t.integer  "108",                       :limit => 2
    t.datetime "valid_from",                             :null => false
    t.datetime "valid_to",                               :null => false
    t.datetime "inserted_at"
  end

  create_table "lanes", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36, :null => false
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

  add_index "lanes", ["barcode"], :name => "index_lanes_on_barcode"
  add_index "lanes", ["barcode_prefix"], :name => "index_lanes_on_barcode_prefix"
  add_index "lanes", ["checked_at"], :name => "index_lanes_on_checked_at"
  add_index "lanes", ["closed"], :name => "index_lanes_on_closed"
  add_index "lanes", ["created"], :name => "index_lanes_on_created"
  add_index "lanes", ["external_release"], :name => "index_lanes_on_external_release"
  add_index "lanes", ["internal_id"], :name => "index_lanes_on_internal_id"
  add_index "lanes", ["is_current"], :name => "index_lanes_on_is_current"
  add_index "lanes", ["last_updated"], :name => "index_lanes_on_last_updated"
  add_index "lanes", ["name"], :name => "index_lanes_on_name"
  add_index "lanes", ["scanned_in_date"], :name => "index_lanes_on_scanned_in_date"
  add_index "lanes", ["state"], :name => "index_lanes_on_state"
  add_index "lanes", ["two_dimensional_barcode"], :name => "index_lanes_on_two_dimensional_barcode"
  add_index "lanes", ["uuid"], :name => "index_lanes_on_uuid"

  create_table "library_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                        :limit => 36,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",              :limit => 2
    t.boolean  "closed"
    t.string   "state",                       :limit => 50
    t.string   "two_dimensional_barcode"
    t.string   "sample_uuid",                 :limit => 36
    t.integer  "sample_internal_id"
    t.decimal  "volume",                                    :precision => 5, :scale => 2
    t.decimal  "concentration",                             :precision => 5, :scale => 2
    t.string   "tag_uuid",                    :limit => 36
    t.integer  "tag_internal_id"
    t.string   "expected_sequence"
    t.integer  "tag_map_id"
    t.string   "tag_group_name"
    t.string   "tag_group_uuid",              :limit => 36
    t.integer  "tag_group_internal_id"
    t.integer  "source_request_internal_id"
    t.string   "source_request_uuid",         :limit => 36
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

  add_index "library_tubes", ["barcode"], :name => "index_library_tubes_on_barcode"
  add_index "library_tubes", ["barcode_prefix"], :name => "index_library_tubes_on_barcode_prefix"
  add_index "library_tubes", ["checked_at"], :name => "index_library_tubes_on_checked_at"
  add_index "library_tubes", ["closed"], :name => "index_library_tubes_on_closed"
  add_index "library_tubes", ["concentration"], :name => "index_library_tubes_on_concentration"
  add_index "library_tubes", ["created"], :name => "index_library_tubes_on_created"
  add_index "library_tubes", ["expected_sequence"], :name => "index_library_tubes_on_expected_sequence"
  add_index "library_tubes", ["fragment_size_required_from"], :name => "index_library_tubes_on_fragment_size_required_from"
  add_index "library_tubes", ["fragment_size_required_to"], :name => "index_library_tubes_on_fragment_size_required_to"
  add_index "library_tubes", ["internal_id"], :name => "index_library_tubes_on_internal_id"
  add_index "library_tubes", ["is_current"], :name => "index_library_tubes_on_is_current"
  add_index "library_tubes", ["last_updated"], :name => "index_library_tubes_on_last_updated"
  add_index "library_tubes", ["library_type"], :name => "index_library_tubes_on_library_type"
  add_index "library_tubes", ["name"], :name => "index_library_tubes_on_name"
  add_index "library_tubes", ["sample_internal_id"], :name => "index_library_tubes_on_sample_internal_id"
  add_index "library_tubes", ["sample_name"], :name => "index_library_tubes_on_sample_name"
  add_index "library_tubes", ["sample_uuid"], :name => "index_library_tubes_on_sample_uuid"
  add_index "library_tubes", ["scanned_in_date"], :name => "index_library_tubes_on_scanned_in_date"
  add_index "library_tubes", ["source_request_internal_id"], :name => "index_library_tubes_on_source_request_internal_id"
  add_index "library_tubes", ["source_request_uuid"], :name => "index_library_tubes_on_source_request_uuid"
  add_index "library_tubes", ["state"], :name => "index_library_tubes_on_state"
  add_index "library_tubes", ["tag_group_internal_id"], :name => "index_library_tubes_on_tag_group_internal_id"
  add_index "library_tubes", ["tag_group_name"], :name => "index_library_tubes_on_tag_group_name"
  add_index "library_tubes", ["tag_group_uuid"], :name => "index_library_tubes_on_tag_group_uuid"
  add_index "library_tubes", ["tag_internal_id"], :name => "index_library_tubes_on_tag_internal_id"
  add_index "library_tubes", ["tag_map_id"], :name => "index_library_tubes_on_tag_map_id"
  add_index "library_tubes", ["tag_uuid"], :name => "index_library_tubes_on_tag_uuid"
  add_index "library_tubes", ["two_dimensional_barcode"], :name => "index_library_tubes_on_two_dimensional_barcode"
  add_index "library_tubes", ["uuid"], :name => "index_library_tubes_on_uuid"
  add_index "library_tubes", ["volume"], :name => "index_library_tubes_on_volume"

  create_table "multiplexed_library_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36,                               :null => false
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
  end

  add_index "multiplexed_library_tubes", ["barcode"], :name => "index_multiplexed_library_tubes_on_barcode"
  add_index "multiplexed_library_tubes", ["barcode_prefix"], :name => "index_multiplexed_library_tubes_on_barcode_prefix"
  add_index "multiplexed_library_tubes", ["checked_at"], :name => "index_multiplexed_library_tubes_on_checked_at"
  add_index "multiplexed_library_tubes", ["closed"], :name => "index_multiplexed_library_tubes_on_closed"
  add_index "multiplexed_library_tubes", ["concentration"], :name => "index_multiplexed_library_tubes_on_concentration"
  add_index "multiplexed_library_tubes", ["created"], :name => "index_multiplexed_library_tubes_on_created"
  add_index "multiplexed_library_tubes", ["internal_id"], :name => "index_multiplexed_library_tubes_on_internal_id"
  add_index "multiplexed_library_tubes", ["is_current"], :name => "index_multiplexed_library_tubes_on_is_current"
  add_index "multiplexed_library_tubes", ["last_updated"], :name => "index_multiplexed_library_tubes_on_last_updated"
  add_index "multiplexed_library_tubes", ["name"], :name => "index_multiplexed_library_tubes_on_name"
  add_index "multiplexed_library_tubes", ["scanned_in_date"], :name => "index_multiplexed_library_tubes_on_scanned_in_date"
  add_index "multiplexed_library_tubes", ["state"], :name => "index_multiplexed_library_tubes_on_state"
  add_index "multiplexed_library_tubes", ["two_dimensional_barcode"], :name => "index_multiplexed_library_tubes_on_two_dimensional_barcode"
  add_index "multiplexed_library_tubes", ["uuid"], :name => "index_multiplexed_library_tubes_on_uuid"
  add_index "multiplexed_library_tubes", ["volume"], :name => "index_multiplexed_library_tubes_on_volume"

  create_table "npg_information", :primary_key => "id_npg_information", :force => true do |t|
    t.integer  "batch_id",                               :limit => 8,                      :null => false
    t.integer  "id_run",                                 :limit => 8,                      :null => false
    t.integer  "position",                                                                 :null => false
    t.integer  "id_run_pair",                            :limit => 8
    t.datetime "run_complete"
    t.integer  "cycles",                                                                   :null => false
    t.integer  "cluster_count",                          :limit => 8
    t.integer  "pf_bases",                               :limit => 8
    t.boolean  "is_dev",                                                :default => false, :null => false
    t.boolean  "has_two_runfolders",                                    :default => false, :null => false
    t.boolean  "paired_read",                                           :default => false, :null => false
    t.boolean  "cancelled",                                             :default => false, :null => false
    t.string   "instrument_name",                        :limit => 32
    t.string   "instrument_model",                       :limit => 64
    t.boolean  "manual_qc"
    t.integer  "clusters_raw",                           :limit => 8
    t.float    "raw_cluster_density",                    :limit => 12
    t.float    "pf_cluster_density",                     :limit => 12
    t.integer  "insert_size_quartile1",                  :limit => 2
    t.integer  "insert_size_quartile3",                  :limit => 2
    t.integer  "insert_size_median",                     :limit => 2
    t.float    "gc_percent_forward_read",                :limit => 4
    t.float    "gc_percent_reverse_read",                :limit => 4
    t.float    "sequence_mismatch_percent_forward_read", :limit => 4
    t.float    "sequence_mismatch_percent_reverse_read", :limit => 4
    t.float    "adapters_percent_forward_read",          :limit => 4
    t.float    "adapters_percent_reverse_read",          :limit => 4
    t.string   "contaminants_scan_hit1_name",            :limit => 50
    t.float    "contaminants_scan_hit1_score",           :limit => 6
    t.string   "contaminants_scan_hit2_name",            :limit => 50
    t.float    "contaminants_scan_hit2_score",           :limit => 6
    t.string   "ref_match1_name",                        :limit => 100
    t.float    "ref_match1_percent",                     :limit => 5
    t.string   "ref_match2_name",                        :limit => 100
    t.float    "ref_match2_percent",                     :limit => 5
    t.datetime "run_pending"
    t.datetime "qc_complete"
    t.float    "tags_decode_percent",                    :limit => 5
    t.integer  "asset_id"
    t.string   "asset_name"
    t.string   "asset_type"
    t.integer  "sample_id"
    t.integer  "request_id"
    t.string   "lane_type",                              :limit => 20
    t.integer  "q20_yield_kb_forward_read"
    t.integer  "q20_yield_kb_reverse_read"
  end

  add_index "npg_information", ["asset_id"], :name => "npg_asset_id_index"
  add_index "npg_information", ["asset_name"], :name => "npg_asset_name_index"
  add_index "npg_information", ["asset_type"], :name => "npg_asset_type_index"
  add_index "npg_information", ["batch_id", "id_run", "position"], :name => "batch_run_pos", :unique => true
  add_index "npg_information", ["id_run", "position"], :name => "id_run_position", :unique => true
  add_index "npg_information", ["request_id"], :name => "npg_request_id_index"
  add_index "npg_information", ["sample_id"], :name => "npg_sample_id_index"

  create_table "npg_plex_information", :id => false, :force => true do |t|
    t.integer "batch_id",                               :limit => 8,   :null => false
    t.integer "id_run",                                 :limit => 8,   :null => false
    t.integer "position",                                              :null => false
    t.integer "tag_index",                              :limit => 2,   :null => false
    t.integer "asset_id"
    t.string  "asset_name"
    t.integer "sample_id"
    t.integer "insert_size_quartile1",                  :limit => 2
    t.integer "insert_size_quartile3",                  :limit => 2
    t.integer "insert_size_median",                     :limit => 2
    t.float   "gc_percent_forward_read",                :limit => 4
    t.float   "gc_percent_reverse_read",                :limit => 4
    t.float   "sequence_mismatch_percent_forward_read", :limit => 4
    t.float   "sequence_mismatch_percent_reverse_read", :limit => 4
    t.float   "adapters_percent_forward_read",          :limit => 4
    t.float   "adapters_percent_reverse_read",          :limit => 4
    t.string  "contaminants_scan_hit1_name",            :limit => 50
    t.float   "contaminants_scan_hit1_score",           :limit => 6
    t.string  "contaminants_scan_hit2_name",            :limit => 50
    t.float   "contaminants_scan_hit2_score",           :limit => 6
    t.string  "ref_match1_name",                        :limit => 100
    t.float   "ref_match1_percent",                     :limit => 5
    t.string  "ref_match2_name",                        :limit => 100
    t.float   "ref_match2_percent",                     :limit => 5
    t.string  "tag_sequence"
    t.float   "tag_decode_percent",                     :limit => 5
    t.integer "tag_decode_count"
    t.integer "q20_yield_kb_forward_read"
    t.integer "q20_yield_kb_reverse_read"
  end

  add_index "npg_plex_information", ["asset_id"], :name => "npg_plex_asset_id_index"
  add_index "npg_plex_information", ["asset_name"], :name => "npg_plex_asset_name_index"
  add_index "npg_plex_information", ["sample_id"], :name => "npg_plex_sample_id_index"

  create_table "npg_run_status", :primary_key => "id_run_status", :force => true do |t|
    t.integer  "id_run",             :limit => 8, :null => false
    t.datetime "date"
    t.integer  "id_run_status_dict",              :null => false
    t.boolean  "iscurrent",                       :null => false
  end

  add_index "npg_run_status", ["id_run", "date", "id_run_status_dict"], :name => "npg_run_date_state"
  add_index "npg_run_status", ["id_run_status_dict"], :name => "npg_id_rsd"
  add_index "npg_run_status", ["iscurrent"], :name => "npg_rs_iscurrent"

  create_table "npg_run_status_dict", :primary_key => "id_run_status_dict", :force => true do |t|
    t.string "description", :limit => 64, :default => "", :null => false
  end 

  add_index "npg_run_status_dict", ["description"], :name => "npg_status_description"

  create_table "orders", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                        :limit => 36, :null => false
    t.integer  "internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "created_by"
    t.string   "template_name"
    t.string   "study_name"
    t.string   "study_uuid",                  :limit => 36
    t.string   "project_name"
    t.string   "project_uuid",                :limit => 36
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

  create_table "plate_purposes", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",         :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "plate_purposes", ["checked_at"], :name => "index_plate_purposes_on_checked_at"
  add_index "plate_purposes", ["created"], :name => "index_plate_purposes_on_created"
  add_index "plate_purposes", ["inserted_at"], :name => "index_plate_purposes_on_inserted_at"
  add_index "plate_purposes", ["internal_id"], :name => "index_plate_purposes_on_internal_id"
  add_index "plate_purposes", ["is_current"], :name => "index_plate_purposes_on_is_current"
  add_index "plate_purposes", ["last_updated"], :name => "index_plate_purposes_on_last_updated"
  add_index "plate_purposes", ["name"], :name => "index_plate_purposes_on_name"
  add_index "plate_purposes", ["uuid"], :name => "index_plate_purposes_on_uuid"

  create_table "plates", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                      :limit => 36, :null => false
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
    t.string   "plate_purpose_uuid",        :limit => 36
    t.string   "infinium_barcode"
    t.string   "location"
    t.datetime "inserted_at"
  end

  add_index "plates", ["barcode"], :name => "index_plates_on_barcode"
  add_index "plates", ["barcode_prefix"], :name => "index_plates_on_barcode_prefix"
  add_index "plates", ["checked_at"], :name => "index_plates_on_checked_at"
  add_index "plates", ["created"], :name => "index_plates_on_created"
  add_index "plates", ["infinium_barcode"], :name => "index_plates_on_infinium_barcode"
  add_index "plates", ["inserted_at"], :name => "index_plates_on_inserted_at"
  add_index "plates", ["internal_id"], :name => "index_plates_on_internal_id"
  add_index "plates", ["is_current"], :name => "index_plates_on_is_current"
  add_index "plates", ["last_updated"], :name => "index_plates_on_last_updated"
  add_index "plates", ["name"], :name => "index_plates_on_name"
  add_index "plates", ["plate_purpose_internal_id"], :name => "index_plates_on_plate_purpose_internal_id"
  add_index "plates", ["plate_purpose_name"], :name => "index_plates_on_plate_purpose_name"
  add_index "plates", ["plate_purpose_uuid"], :name => "index_plates_on_plate_purpose_uuid"
  add_index "plates", ["plate_size"], :name => "index_plates_on_plate_size"
  add_index "plates", ["uuid"], :name => "index_plates_on_uuid"

  create_table "projects", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36, :null => false
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

  add_index "projects", ["approved"], :name => "index_projects_on_approved"
  add_index "projects", ["budget_cost_centre"], :name => "index_projects_on_budget_cost_centre"
  add_index "projects", ["budget_division"], :name => "index_projects_on_budget_division"
  add_index "projects", ["checked_at"], :name => "index_projects_on_checked_at"
  add_index "projects", ["collaborators"], :name => "index_projects_on_collaborators"
  add_index "projects", ["cost_code"], :name => "index_projects_on_cost_code"
  add_index "projects", ["created"], :name => "index_projects_on_created"
  add_index "projects", ["external_funding_source"], :name => "index_projects_on_external_funding_source"
  add_index "projects", ["funding_model"], :name => "index_projects_on_funding_model"
  add_index "projects", ["internal_id"], :name => "index_projects_on_internal_id"
  add_index "projects", ["is_current"], :name => "index_projects_on_is_current"
  add_index "projects", ["last_updated"], :name => "index_projects_on_last_updated"
  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["project_manager"], :name => "index_projects_on_project_manager"
  add_index "projects", ["state"], :name => "index_projects_on_state"
  add_index "projects", ["uuid"], :name => "index_projects_on_uuid"

  create_table "pulldown_multiplexed_library_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36,                               :null => false
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

  add_index "pulldown_multiplexed_library_tubes", ["created"], :name => "index_pulldown_multiplexed_library_tubes_on_created"
  add_index "pulldown_multiplexed_library_tubes", ["internal_id"], :name => "index_pulldown_multiplexed_library_tubes_on_internal_id"
  add_index "pulldown_multiplexed_library_tubes", ["last_updated"], :name => "index_pulldown_multiplexed_library_tubes_on_last_updated"
  add_index "pulldown_multiplexed_library_tubes", ["uuid"], :name => "index_pulldown_multiplexed_library_tubes_on_uuid"

  create_table "quotas", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                :limit => 36, :null => false
    t.integer  "internal_id"
    t.integer  "quota_limit"
    t.string   "request_type"
    t.integer  "project_internal_id"
    t.string   "project_uuid",        :limit => 36
    t.string   "project_name"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "quotas", ["checked_at"], :name => "index_quotas_on_checked_at"
  add_index "quotas", ["created"], :name => "index_quotas_on_created"
  add_index "quotas", ["internal_id"], :name => "index_quotas_on_internal_id"
  add_index "quotas", ["is_current"], :name => "index_quotas_on_is_current"
  add_index "quotas", ["last_updated"], :name => "index_quotas_on_last_updated"
  add_index "quotas", ["project_internal_id"], :name => "index_quotas_on_project_internal_id"
  add_index "quotas", ["project_name"], :name => "index_quotas_on_project_name"
  add_index "quotas", ["project_uuid"], :name => "index_quotas_on_project_uuid"
  add_index "quotas", ["quota_limit"], :name => "index_quotas_on_quota_limit"
  add_index "quotas", ["request_type"], :name => "index_quotas_on_request_type"
  add_index "quotas", ["uuid"], :name => "index_quotas_on_uuid"

  create_table "requests", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                                 :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "request_type"
    t.string   "fragment_size_from"
    t.string   "fragment_size_to"
    t.integer  "read_length"
    t.string   "library_type"
    t.string   "study_uuid",                           :limit => 36
    t.integer  "study_internal_id"
    t.string   "study_name"
    t.string   "project_uuid",                         :limit => 36
    t.integer  "project_internal_id"
    t.string   "project_name"
    t.string   "source_asset_uuid",                    :limit => 36
    t.integer  "source_asset_internal_id"
    t.string   "source_asset_type",                    :limit => 50
    t.string   "source_asset_name"
    t.string   "source_asset_barcode"
    t.string   "source_asset_barcode_prefix"
    t.string   "source_asset_state"
    t.string   "source_asset_closed"
    t.string   "source_asset_two_dimensional_barcode"
    t.string   "source_asset_sample_uuid",             :limit => 36
    t.integer  "source_asset_sample_internal_id"
    t.string   "target_asset_uuid",                    :limit => 36
    t.integer  "target_asset_internal_id"
    t.string   "target_asset_type",                    :limit => 50
    t.string   "target_asset_name"
    t.string   "target_asset_barcode"
    t.string   "target_asset_barcode_prefix"
    t.string   "target_asset_state"
    t.string   "target_asset_closed"
    t.string   "target_asset_two_dimensional_barcode"
    t.string   "target_asset_sample_uuid",             :limit => 36
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

  add_index "requests", ["checked_at"], :name => "index_requests_on_checked_at"
  add_index "requests", ["created"], :name => "index_requests_on_created"
  add_index "requests", ["fragment_size_from"], :name => "index_requests_on_fragment_size_from"
  add_index "requests", ["fragment_size_to"], :name => "index_requests_on_fragment_size_to"
  add_index "requests", ["inserted_at"], :name => "index_requests_on_inserted_at"
  add_index "requests", ["internal_id"], :name => "index_requests_on_internal_id"
  add_index "requests", ["is_current"], :name => "index_requests_on_is_current"
  add_index "requests", ["is_current"], :name => "study_id_is_current"
  add_index "requests", ["last_updated"], :name => "index_requests_on_last_updated"
  add_index "requests", ["library_type"], :name => "index_requests_on_library_type"
  add_index "requests", ["priority"], :name => "index_requests_on_priority"
  add_index "requests", ["project_internal_id"], :name => "index_requests_on_project_internal_id"
  add_index "requests", ["project_name"], :name => "index_requests_on_project_name"
  add_index "requests", ["project_uuid"], :name => "index_requests_on_project_uuid"
  add_index "requests", ["read_length"], :name => "index_requests_on_read_length"
  add_index "requests", ["request_type"], :name => "index_requests_on_request_type"
  add_index "requests", ["source_asset_barcode"], :name => "index_requests_on_source_asset_barcode"
  add_index "requests", ["source_asset_barcode_prefix"], :name => "index_requests_on_source_asset_barcode_prefix"
  add_index "requests", ["source_asset_closed"], :name => "index_requests_on_source_asset_closed"
  add_index "requests", ["source_asset_internal_id"], :name => "index_requests_on_source_asset_internal_id"
  add_index "requests", ["source_asset_name"], :name => "index_requests_on_source_asset_name"
  add_index "requests", ["source_asset_sample_internal_id"], :name => "index_requests_on_source_asset_sample_internal_id"
  add_index "requests", ["source_asset_sample_uuid"], :name => "index_requests_on_source_asset_sample_uuid"
  add_index "requests", ["source_asset_state"], :name => "index_requests_on_source_asset_state"
  add_index "requests", ["source_asset_two_dimensional_barcode"], :name => "index_requests_on_source_asset_two_dimensional_barcode"
  add_index "requests", ["source_asset_type"], :name => "index_requests_on_source_asset_type"
  add_index "requests", ["source_asset_uuid"], :name => "index_requests_on_source_asset_uuid"
  add_index "requests", ["state"], :name => "index_requests_on_state"
  add_index "requests", ["study_internal_id"], :name => "index_requests_on_study_internal_id"
  add_index "requests", ["study_name"], :name => "index_requests_on_study_name"
  add_index "requests", ["study_uuid"], :name => "index_requests_on_study_uuid"
  add_index "requests", ["target_asset_barcode"], :name => "index_requests_on_target_asset_barcode"
  add_index "requests", ["target_asset_barcode_prefix"], :name => "index_requests_on_target_asset_barcode_prefix"
  add_index "requests", ["target_asset_closed"], :name => "index_requests_on_target_asset_closed"
  add_index "requests", ["target_asset_internal_id"], :name => "index_requests_on_target_asset_internal_id"
  add_index "requests", ["target_asset_name"], :name => "index_requests_on_target_asset_name"
  add_index "requests", ["target_asset_sample_internal_id"], :name => "index_requests_on_target_asset_sample_internal_id"
  add_index "requests", ["target_asset_sample_uuid"], :name => "index_requests_on_target_asset_sample_uuid"
  add_index "requests", ["target_asset_state"], :name => "index_requests_on_target_asset_state"
  add_index "requests", ["target_asset_two_dimensional_barcode"], :name => "index_requests_on_target_asset_two_dimensional_barcode"
  add_index "requests", ["target_asset_type"], :name => "index_requests_on_target_asset_type"
  add_index "requests", ["target_asset_uuid"], :name => "index_requests_on_target_asset_uuid"
  add_index "requests", ["user"], :name => "index_requests_on_user"
  add_index "requests", ["uuid"], :name => "index_requests_on_uuid"

  create_table "sample_tubes", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.string   "sample_uuid",             :limit => 36
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

  add_index "sample_tubes", ["barcode"], :name => "index_sample_tubes_on_barcode"
  add_index "sample_tubes", ["barcode_prefix"], :name => "index_sample_tubes_on_barcode_prefix"
  add_index "sample_tubes", ["checked_at"], :name => "index_sample_tubes_on_checked_at"
  add_index "sample_tubes", ["closed"], :name => "index_sample_tubes_on_closed"
  add_index "sample_tubes", ["concentration"], :name => "index_sample_tubes_on_concentration"
  add_index "sample_tubes", ["created"], :name => "index_sample_tubes_on_created"
  add_index "sample_tubes", ["internal_id"], :name => "index_sample_tubes_on_internal_id"
  add_index "sample_tubes", ["is_current"], :name => "index_sample_tubes_on_is_current"
  add_index "sample_tubes", ["last_updated"], :name => "index_sample_tubes_on_last_updated"
  add_index "sample_tubes", ["name"], :name => "index_sample_tubes_on_name"
  add_index "sample_tubes", ["sample_internal_id"], :name => "index_sample_tubes_on_sample_internal_id"
  add_index "sample_tubes", ["sample_name"], :name => "index_sample_tubes_on_sample_name"
  add_index "sample_tubes", ["sample_uuid"], :name => "index_sample_tubes_on_sample_uuid"
  add_index "sample_tubes", ["scanned_in_date"], :name => "index_sample_tubes_on_scanned_in_date"
  add_index "sample_tubes", ["state"], :name => "index_sample_tubes_on_state"
  add_index "sample_tubes", ["two_dimensional_barcode"], :name => "index_sample_tubes_on_two_dimensional_barcode"
  add_index "sample_tubes", ["uuid"], :name => "index_sample_tubes_on_uuid"
  add_index "sample_tubes", ["volume"], :name => "index_sample_tubes_on_volume"

  create_table "samples", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                       :limit => 36, :null => false
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

  add_index "samples", ["accession_number"], :name => "index_samples_on_accession_number"
  add_index "samples", ["checked_at"], :name => "index_samples_on_checked_at"
  add_index "samples", ["cohort"], :name => "index_samples_on_cohort"
  add_index "samples", ["common_name"], :name => "index_samples_on_common_name"
  add_index "samples", ["control"], :name => "index_samples_on_control"
  add_index "samples", ["country_of_origin"], :name => "index_samples_on_country_of_origin"
  add_index "samples", ["created"], :name => "index_samples_on_created"
  add_index "samples", ["empty_supplier_sample_name"], :name => "index_samples_on_empty_supplier_sample_name"
  add_index "samples", ["ethnicity"], :name => "index_samples_on_ethnicity"
  add_index "samples", ["father"], :name => "index_samples_on_father"
  add_index "samples", ["gender"], :name => "index_samples_on_gender"
  add_index "samples", ["geographical_region"], :name => "index_samples_on_geographical_region"
  add_index "samples", ["inserted_at"], :name => "index_samples_on_inserted_at"
  add_index "samples", ["internal_id"], :name => "index_samples_on_internal_id"
  add_index "samples", ["is_current"], :name => "index_samples_on_is_current"
  add_index "samples", ["last_updated"], :name => "index_samples_on_last_updated"
  add_index "samples", ["mother"], :name => "index_samples_on_mother"
  add_index "samples", ["name"], :name => "index_samples_on_name"
  add_index "samples", ["organism"], :name => "index_samples_on_organism"
  add_index "samples", ["reference_genome"], :name => "index_samples_on_reference_genome"
  add_index "samples", ["replicate"], :name => "index_samples_on_replicate"
  add_index "samples", ["sanger_sample_id"], :name => "index_samples_on_sanger_sample_id"
  add_index "samples", ["supplier_name"], :name => "index_samples_on_supplier_name"
  add_index "samples", ["taxon_id"], :name => "index_samples_on_taxon_id"
  add_index "samples", ["uuid"], :name => "index_samples_on_uuid"

  create_table "studies", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                           :limit => 36, :null => false
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

  add_index "studies", ["abbreviation"], :name => "index_studies_on_abbreviation"
  add_index "studies", ["accession_number"], :name => "index_studies_on_accession_number"
  add_index "studies", ["checked_at"], :name => "index_studies_on_checked_at"
  add_index "studies", ["created"], :name => "index_studies_on_created"
  add_index "studies", ["ethically_approved"], :name => "index_studies_on_ethically_approved"
  add_index "studies", ["faculty_sponsor"], :name => "index_studies_on_faculty_sponsor"
  add_index "studies", ["internal_id"], :name => "index_studies_on_internal_id"
  add_index "studies", ["is_current"], :name => "index_studies_on_is_current"
  add_index "studies", ["last_updated"], :name => "index_studies_on_last_updated"
  add_index "studies", ["name"], :name => "index_studies_on_name"
  add_index "studies", ["reference_genome"], :name => "index_studies_on_reference_genome"
  add_index "studies", ["state"], :name => "index_studies_on_state"
  add_index "studies", ["study_type"], :name => "index_studies_on_study_type"
  add_index "studies", ["uuid"], :name => "index_studies_on_uuid"

  create_table "study_samples", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",               :limit => 36
    t.integer  "internal_id"
    t.integer  "sample_internal_id"
    t.string   "sample_uuid",        :limit => 36
    t.integer  "study_internal_id"
    t.string   "study_uuid",         :limit => 36
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "study_samples", ["checked_at"], :name => "index_study_samples_on_checked_at"
  add_index "study_samples", ["created"], :name => "index_study_samples_on_created"
  add_index "study_samples", ["internal_id"], :name => "index_study_samples_on_internal_id"
  add_index "study_samples", ["is_current"], :name => "index_study_samples_on_is_current"
  add_index "study_samples", ["last_updated"], :name => "index_study_samples_on_last_updated"
  add_index "study_samples", ["sample_internal_id"], :name => "index_study_samples_on_sample_internal_id"
  add_index "study_samples", ["sample_uuid"], :name => "index_study_samples_on_sample_uuid"
  add_index "study_samples", ["study_internal_id"], :name => "index_study_samples_on_study_internal_id"
  add_index "study_samples", ["study_uuid"], :name => "index_study_samples_on_study_uuid"
  add_index "study_samples", ["uuid"], :name => "index_study_samples_on_uuid"

  create_table "submissions", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                        :limit => 36, :null => false
    t.integer  "internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "created_by"
    t.string   "template_name"
    t.string   "state"
    t.string   "study_name"
    t.string   "study_uuid",                  :limit => 36
    t.string   "project_name"
    t.string   "project_uuid",                :limit => 36
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

  add_index "submissions", ["created"], :name => "index_submissions_on_created"
  add_index "submissions", ["internal_id"], :name => "index_submissions_on_internal_id"
  add_index "submissions", ["last_updated"], :name => "index_submissions_on_last_updated"
  add_index "submissions", ["project_uuid"], :name => "index_submissions_on_project_uuid"
  add_index "submissions", ["study_uuid"], :name => "index_submissions_on_study_uuid"
  add_index "submissions", ["uuid"], :name => "index_submissions_on_uuid"

  create_table "submitted_assets", :primary_key => "dont_use_id", :force => true do |t|
    t.string "submission_uuid"
    t.string "asset_uuid"
  end

  add_index "submitted_assets", ["asset_uuid"], :name => "index_submitted_assets_on_asset_uuid"
  add_index "submitted_assets", ["submission_uuid"], :name => "index_submitted_assets_on_submission_uuid"

  create_table "tag_instances", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.string   "two_dimensional_barcode"
    t.string   "tag_uuid",                :limit => 36
    t.integer  "tag_internal_id"
    t.string   "tag_expected_sequence"
    t.integer  "tag_map_id"
    t.string   "tag_group_name"
    t.string   "tag_group_uuid",          :limit => 36
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "tag_instances", ["barcode"], :name => "index_tag_instances_on_barcode"
  add_index "tag_instances", ["barcode_prefix"], :name => "index_tag_instances_on_barcode_prefix"
  add_index "tag_instances", ["checked_at"], :name => "index_tag_instances_on_checked_at"
  add_index "tag_instances", ["created"], :name => "index_tag_instances_on_created"
  add_index "tag_instances", ["internal_id"], :name => "index_tag_instances_on_internal_id"
  add_index "tag_instances", ["is_current"], :name => "index_tag_instances_on_is_current"
  add_index "tag_instances", ["last_updated"], :name => "index_tag_instances_on_last_updated"
  add_index "tag_instances", ["name"], :name => "index_tag_instances_on_name"
  add_index "tag_instances", ["tag_expected_sequence"], :name => "index_tag_instances_on_tag_expected_sequence"
  add_index "tag_instances", ["tag_group_internal_id"], :name => "index_tag_instances_on_tag_group_internal_id"
  add_index "tag_instances", ["tag_group_name"], :name => "index_tag_instances_on_tag_group_name"
  add_index "tag_instances", ["tag_group_uuid"], :name => "index_tag_instances_on_tag_group_uuid"
  add_index "tag_instances", ["tag_internal_id"], :name => "index_tag_instances_on_tag_internal_id"
  add_index "tag_instances", ["tag_map_id"], :name => "index_tag_instances_on_tag_map_id"
  add_index "tag_instances", ["tag_uuid"], :name => "index_tag_instances_on_tag_uuid"
  add_index "tag_instances", ["two_dimensional_barcode"], :name => "index_tag_instances_on_two_dimensional_barcode"
  add_index "tag_instances", ["uuid"], :name => "index_tag_instances_on_uuid"

  create_table "tags", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                  :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "expected_sequence"
    t.integer  "map_id"
    t.string   "tag_group_name"
    t.string   "tag_group_uuid",        :limit => 36
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
  end

  add_index "tags", ["checked_at"], :name => "index_tags_on_checked_at"
  add_index "tags", ["created"], :name => "index_tags_on_created"
  add_index "tags", ["expected_sequence"], :name => "index_tags_on_expected_sequence"
  add_index "tags", ["internal_id"], :name => "index_tags_on_internal_id"
  add_index "tags", ["is_current"], :name => "index_tags_on_is_current"
  add_index "tags", ["last_updated"], :name => "index_tags_on_last_updated"
  add_index "tags", ["map_id"], :name => "index_tags_on_map_id"
  add_index "tags", ["tag_group_internal_id"], :name => "index_tags_on_tag_group_internal_id"
  add_index "tags", ["tag_group_name"], :name => "index_tags_on_tag_group_name"
  add_index "tags", ["tag_group_uuid"], :name => "index_tags_on_tag_group_uuid"
  add_index "tags", ["uuid"], :name => "index_tags_on_uuid"

  create_table "uuid_objects", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",         :limit => 36, :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "object_name"
    t.datetime "checked_at"
    t.datetime "last_updated"
    t.datetime "created"
    t.boolean  "deleted"
  end

  add_index "uuid_objects", ["checked_at"], :name => "index_uuid_objects_on_checked_at"
  add_index "uuid_objects", ["created"], :name => "index_uuid_objects_on_created"
  add_index "uuid_objects", ["internal_id"], :name => "index_uuid_objects_on_internal_id"
  add_index "uuid_objects", ["last_updated"], :name => "index_uuid_objects_on_last_updated"
  add_index "uuid_objects", ["name"], :name => "index_uuid_objects_on_name"
  add_index "uuid_objects", ["object_name"], :name => "index_uuid_objects_on_object_name"
  add_index "uuid_objects", ["uuid"], :name => "index_uuid_objects_on_uuid", :unique => true

  create_table "wells", :primary_key => "dont_use_id", :force => true do |t|
    t.string   "uuid",                    :limit => 36,                               :null => false
    t.integer  "internal_id"
    t.string   "name"
    t.string   "map",                     :limit => 5
    t.string   "plate_barcode"
    t.string   "plate_barcode_prefix",    :limit => 2
    t.string   "sample_uuid",             :limit => 36
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
    t.string   "plate_uuid",              :limit => 36
    t.decimal  "measured_volume",                       :precision => 5, :scale => 2
    t.integer  "sequenom_count"
    t.string   "gender_markers",          :limit => 40
    t.string   "genotyping_status"
    t.string   "genotyping_snp_plate_id"
    t.datetime "inserted_at"
  end

  add_index "wells", ["buffer_volume"], :name => "index_wells_on_buffer_volume"
  add_index "wells", ["checked_at"], :name => "index_wells_on_checked_at"
  add_index "wells", ["concentration"], :name => "index_wells_on_concentration"
  add_index "wells", ["created"], :name => "index_wells_on_created"
  add_index "wells", ["current_volume"], :name => "index_wells_on_current_volume"
  add_index "wells", ["gel_pass"], :name => "index_wells_on_gel_pass"
  add_index "wells", ["inserted_at"], :name => "index_wells_on_inserted_at"
  add_index "wells", ["internal_id"], :name => "index_wells_on_internal_id"
  add_index "wells", ["is_current"], :name => "index_wells_on_is_current"
  add_index "wells", ["last_updated"], :name => "index_wells_on_last_updated"
  add_index "wells", ["map"], :name => "index_wells_on_map"
  add_index "wells", ["name"], :name => "index_wells_on_name"
  add_index "wells", ["picked_volume"], :name => "index_wells_on_picked_volume"
  add_index "wells", ["pico_pass"], :name => "index_wells_on_pico_pass"
  add_index "wells", ["plate_barcode"], :name => "index_wells_on_plate_barcode"
  add_index "wells", ["requested_volume"], :name => "index_wells_on_requested_volume"
  add_index "wells", ["sample_internal_id"], :name => "index_wells_on_sample_internal_id"
  add_index "wells", ["sample_name"], :name => "index_wells_on_sample_name"
  add_index "wells", ["sample_uuid"], :name => "index_wells_on_sample_uuid"
  add_index "wells", ["uuid"], :name => "index_wells_on_uuid"

end
