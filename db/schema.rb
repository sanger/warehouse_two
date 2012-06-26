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

ActiveRecord::Schema.define(:version => 20120626112000) do

  create_table "aliquots", :id => false, :force => true do |t|
    t.binary   "uuid",                     :limit => 16, :null => false
    t.integer  "internal_id",                            :null => false
    t.binary   "receptacle_uuid",          :limit => 16
    t.integer  "receptacle_internal_id"
    t.binary   "study_uuid",               :limit => 16
    t.integer  "study_internal_id"
    t.binary   "project_uuid",             :limit => 16
    t.integer  "project_internal_id"
    t.binary   "library_uuid",             :limit => 16
    t.integer  "library_internal_id"
    t.binary   "sample_uuid",              :limit => 16
    t.integer  "sample_internal_id"
    t.binary   "tag_uuid",                 :limit => 16
    t.integer  "tag_internal_id"
    t.string   "receptacle_type"
    t.string   "library_type"
    t.integer  "insert_size_from"
    t.integer  "insert_size_to"
    t.boolean  "is_current",                             :null => false
    t.datetime "checked_at",                             :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                           :null => false
    t.datetime "current_to"
    t.string   "bait_name"
    t.string   "bait_target_species"
    t.string   "bait_supplier_identifier"
    t.string   "bait_supplier_name"
  end

  add_index "aliquots", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "asset_audits", :id => false, :force => true do |t|
    t.binary   "uuid",                 :limit => 16, :null => false
    t.integer  "internal_id",                        :null => false
    t.string   "key"
    t.string   "message"
    t.string   "created_by"
    t.boolean  "is_current",                         :null => false
    t.datetime "checked_at",                         :null => false
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

  add_index "asset_audits", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

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

  add_index "asset_links", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "batch_requests", :id => false, :force => true do |t|
    t.binary   "uuid",                     :limit => 16, :null => false
    t.integer  "internal_id",                            :null => false
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
    t.boolean  "is_current",                             :null => false
    t.datetime "checked_at",                             :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                           :null => false
    t.datetime "current_to"
  end

  add_index "batch_requests", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "batches", :id => false, :force => true do |t|
    t.binary   "uuid",                 :limit => 16, :null => false
    t.integer  "internal_id",                        :null => false
    t.string   "created_by",           :limit => 30
    t.string   "assigned_to",          :limit => 30
    t.string   "pipeline_name"
    t.binary   "pipeline_uuid",        :limit => 16
    t.integer  "pipeline_internal_id"
    t.string   "state",                :limit => 50
    t.string   "qc_state",             :limit => 50
    t.string   "production_state",     :limit => 50
    t.boolean  "is_current",                         :null => false
    t.datetime "checked_at",                         :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                       :null => false
    t.datetime "current_to"
  end

  add_index "batches", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "billing_events", :id => false, :force => true do |t|
    t.binary   "uuid",                :limit => 16, :null => false
    t.integer  "internal_id",                       :null => false
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
    t.boolean  "is_current",                        :null => false
    t.datetime "entry_date"
    t.datetime "checked_at",                        :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                      :null => false
    t.datetime "current_to"
    t.string   "bait_library_type"
  end

  add_index "billing_events", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "current_aliquots", :id => false, :force => true do |t|
    t.binary   "uuid",                     :limit => 16, :null => false
    t.integer  "internal_id",                            :null => false
    t.binary   "receptacle_uuid",          :limit => 16
    t.integer  "receptacle_internal_id"
    t.binary   "study_uuid",               :limit => 16
    t.integer  "study_internal_id"
    t.binary   "project_uuid",             :limit => 16
    t.integer  "project_internal_id"
    t.binary   "library_uuid",             :limit => 16
    t.integer  "library_internal_id"
    t.binary   "sample_uuid",              :limit => 16
    t.integer  "sample_internal_id"
    t.binary   "tag_uuid",                 :limit => 16
    t.integer  "tag_internal_id"
    t.string   "receptacle_type"
    t.string   "library_type"
    t.integer  "insert_size_from"
    t.integer  "insert_size_to"
    t.boolean  "is_current",                             :null => false
    t.datetime "checked_at",                             :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                           :null => false
    t.datetime "current_to"
    t.string   "bait_name"
    t.string   "bait_target_species"
    t.string   "bait_supplier_identifier"
    t.string   "bait_supplier_name"
  end

  add_index "current_aliquots", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_aliquots", ["library_internal_id", "study_internal_id"], :name => "library_internal_id_study_internal_id_idx"
  add_index "current_aliquots", ["library_uuid", "receptacle_type"], :name => "library_uuid_and_receptacle_type_idx"
  add_index "current_aliquots", ["receptacle_internal_id"], :name => "receptacle_internal_id_idx"
  add_index "current_aliquots", ["sample_internal_id", "receptacle_internal_id"], :name => "sample_internal_id_receptacle_internal_id_idx"
  add_index "current_aliquots", ["study_internal_id", "receptacle_internal_id"], :name => "study_internal_id_receptacle_internal_id_idx"
  add_index "current_aliquots", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_asset_audits", :id => false, :force => true do |t|
    t.binary   "uuid",                 :limit => 16, :null => false
    t.integer  "internal_id",                        :null => false
    t.string   "key"
    t.string   "message"
    t.string   "created_by"
    t.boolean  "is_current",                         :null => false
    t.datetime "checked_at",                         :null => false
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

  add_index "current_asset_audits", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_asset_audits", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_asset_links", :id => false, :force => true do |t|
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

  add_index "current_asset_links", ["ancestor_internal_id", "descendant_internal_id", "descendant_type"], :name => "ancestor_internal_id_descendant_internal_id_descendant_type_idx"
  add_index "current_asset_links", ["descendant_internal_id", "ancestor_internal_id", "ancestor_type"], :name => "descendant_internal_id_ancestor_internal_id_ancestor_type_idx"
  add_index "current_asset_links", ["descendant_uuid", "ancestor_uuid"], :name => "descendant_uuid_ancestor_uuid_idx"
  add_index "current_asset_links", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_batch_requests", :id => false, :force => true do |t|
    t.binary   "uuid",                     :limit => 16, :null => false
    t.integer  "internal_id",                            :null => false
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
    t.boolean  "is_current",                             :null => false
    t.datetime "checked_at",                             :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                           :null => false
    t.datetime "current_to"
  end

  add_index "current_batch_requests", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_batch_requests", ["source_asset_internal_id", "request_internal_id"], :name => "source_asset_internal_id_request_internal_id_idx"
  add_index "current_batch_requests", ["target_asset_internal_id", "batch_uuid"], :name => "target_asset_internal_id_batch_uuid_idx"
  add_index "current_batch_requests", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_batches", :id => false, :force => true do |t|
    t.binary   "uuid",                 :limit => 16, :null => false
    t.integer  "internal_id",                        :null => false
    t.string   "created_by",           :limit => 30
    t.string   "assigned_to",          :limit => 30
    t.string   "pipeline_name"
    t.binary   "pipeline_uuid",        :limit => 16
    t.integer  "pipeline_internal_id"
    t.string   "state",                :limit => 50
    t.string   "qc_state",             :limit => 50
    t.string   "production_state",     :limit => 50
    t.boolean  "is_current",                         :null => false
    t.datetime "checked_at",                         :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                       :null => false
    t.datetime "current_to"
  end

  add_index "current_batches", ["created_by"], :name => "created_by_idx"
  add_index "current_batches", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_batches", ["state"], :name => "state_idx"
  add_index "current_batches", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_billing_events", :id => false, :force => true do |t|
    t.binary   "uuid",                :limit => 16, :null => false
    t.integer  "internal_id",                       :null => false
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
    t.boolean  "is_current",                        :null => false
    t.datetime "entry_date"
    t.datetime "checked_at",                        :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                      :null => false
    t.datetime "current_to"
    t.string   "bait_library_type"
  end

  add_index "current_billing_events", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_billing_events", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_events", :id => false, :force => true do |t|
    t.binary   "uuid",               :limit => 16, :null => false
    t.integer  "internal_id",                      :null => false
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
    t.boolean  "is_current",                       :null => false
    t.datetime "checked_at",                       :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                     :null => false
    t.datetime "current_to"
  end

  add_index "current_events", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_events", ["source_uuid", "state"], :name => "source_uuid_and_state_idx"
  add_index "current_events", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_lanes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16, :null => false
    t.integer  "internal_id",                           :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.boolean  "external_release"
    t.boolean  "is_current",                            :null => false
    t.date     "scanned_in_date"
    t.datetime "checked_at",                            :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                          :null => false
    t.datetime "current_to"
  end

  add_index "current_lanes", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_lanes", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_library_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                        :limit => 16,                                :null => false
    t.integer  "internal_id",                                                              :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",              :limit => 2
    t.boolean  "closed"
    t.string   "state",                       :limit => 50
    t.string   "two_dimensional_barcode"
    t.binary   "sample_uuid",                 :limit => 16
    t.integer  "sample_internal_id"
    t.decimal  "volume",                                    :precision => 5,  :scale => 2
    t.decimal  "concentration",                             :precision => 10, :scale => 2
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
    t.boolean  "is_current",                                                               :null => false
    t.date     "scanned_in_date"
    t.datetime "checked_at",                                                               :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                             :null => false
    t.datetime "current_to"
  end

  add_index "current_library_tubes", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_library_tubes", ["name"], :name => "name_idx"
  add_index "current_library_tubes", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_multiplexed_library_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                                :null => false
    t.integer  "internal_id",                                                          :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.decimal  "volume",                                :precision => 5,  :scale => 2
    t.decimal  "concentration",                         :precision => 10, :scale => 2
    t.boolean  "is_current",                                                           :null => false
    t.date     "scanned_in_date"
    t.datetime "checked_at",                                                           :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                         :null => false
    t.datetime "current_to"
  end

  add_index "current_multiplexed_library_tubes", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_multiplexed_library_tubes", ["name"], :name => "name_idx"
  add_index "current_multiplexed_library_tubes", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_orders", :id => false, :force => true do |t|
    t.binary   "uuid",                        :limit => 16, :null => false
    t.integer  "internal_id",                               :null => false
    t.boolean  "is_current",                                :null => false
    t.datetime "checked_at",                                :null => false
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

  add_index "current_orders", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_orders", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_pac_bio_library_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                               :null => false
    t.integer  "internal_id",                                                         :null => false
    t.string   "name"
    t.string   "barcode_prefix",          :limit => 2
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.decimal  "volume",                                :precision => 5, :scale => 2
    t.decimal  "concentration",                         :precision => 5, :scale => 2
    t.date     "scanned_in_date"
    t.string   "public_name"
    t.string   "prep_kit_barcode"
    t.string   "binding_kit_barcode"
    t.string   "smrt_cells_available"
    t.string   "movie_length"
    t.string   "protocol"
    t.boolean  "is_current",                                                          :null => false
    t.datetime "checked_at",                                                          :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                        :null => false
    t.datetime "current_to"
  end

  add_index "current_pac_bio_library_tubes", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_pac_bio_library_tubes", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_plate_purposes", :id => false, :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id",                :null => false
    t.string   "name"
    t.boolean  "is_current",                 :null => false
    t.datetime "checked_at",                 :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",               :null => false
    t.datetime "current_to"
  end

  add_index "current_plate_purposes", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_plate_purposes", ["name"], :name => "name_idx"
  add_index "current_plate_purposes", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_plates", :id => false, :force => true do |t|
    t.binary   "uuid",                      :limit => 16, :null => false
    t.integer  "internal_id",                             :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",            :limit => 2
    t.integer  "plate_size"
    t.boolean  "is_current",                              :null => false
    t.datetime "checked_at",                              :null => false
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

  add_index "current_plates", ["barcode"], :name => "barcode_idx"
  add_index "current_plates", ["infinium_barcode", "barcode"], :name => "infinium_barcode_and_barcode_idx"
  add_index "current_plates", ["inserted_at"], :name => "inserted_at_idx"
  add_index "current_plates", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_plates", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_projects", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16, :null => false
    t.integer  "internal_id",                           :null => false
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
    t.boolean  "is_current",                            :null => false
    t.datetime "checked_at",                            :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                          :null => false
    t.datetime "current_to"
  end

  add_index "current_projects", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_projects", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_quotas", :id => false, :force => true do |t|
    t.binary   "uuid",                :limit => 16, :null => false
    t.integer  "internal_id",                       :null => false
    t.integer  "quota_limit"
    t.string   "request_type"
    t.integer  "project_internal_id"
    t.binary   "project_uuid",        :limit => 16
    t.string   "project_name"
    t.boolean  "is_current",                        :null => false
    t.datetime "checked_at",                        :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                      :null => false
    t.datetime "current_to"
  end

  add_index "current_quotas", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_quotas", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_requests", :id => false, :force => true do |t|
    t.binary   "uuid",                                 :limit => 16, :null => false
    t.integer  "internal_id",                                        :null => false
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
    t.boolean  "is_current",                                         :null => false
    t.datetime "checked_at",                                         :null => false
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

  add_index "current_requests", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_requests", ["source_asset_internal_id", "target_asset_internal_id", "source_asset_type"], :name => "assets_via_internal_id_from_source_idx"
  add_index "current_requests", ["source_asset_uuid", "request_type"], :name => "source_asset_uuid_and_request_type_idx"
  add_index "current_requests", ["study_internal_id"], :name => "study_internal_id_idx"
  add_index "current_requests", ["target_asset_internal_id", "source_asset_internal_id", "target_asset_type"], :name => "assets_via_internal_id_idx"
  add_index "current_requests", ["target_asset_uuid", "source_asset_internal_id"], :name => "target_asset_uuid_source_asset_internal_id_idx"
  add_index "current_requests", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_sample_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                                :null => false
    t.integer  "internal_id",                                                          :null => false
    t.string   "name"
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.binary   "sample_uuid",             :limit => 16
    t.integer  "sample_internal_id"
    t.string   "sample_name"
    t.date     "scanned_in_date"
    t.decimal  "volume",                                :precision => 5,  :scale => 2
    t.decimal  "concentration",                         :precision => 10, :scale => 2
    t.boolean  "is_current",                                                           :null => false
    t.datetime "checked_at",                                                           :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "barcode_prefix",          :limit => 2
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                         :null => false
    t.datetime "current_to"
  end

  add_index "current_sample_tubes", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_sample_tubes", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_samples", :id => false, :force => true do |t|
    t.binary   "uuid",                       :limit => 16,                    :null => false
    t.integer  "internal_id",                                                 :null => false
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
    t.boolean  "is_current",                                                  :null => false
    t.datetime "checked_at",                                                  :null => false
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
    t.datetime "current_from",                                                :null => false
    t.datetime "current_to"
    t.boolean  "consent_withdrawn",                        :default => false, :null => false
  end

  add_index "current_samples", ["accession_number"], :name => "accession_number_idx"
  add_index "current_samples", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_samples", ["name"], :name => "name_idx"
  add_index "current_samples", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_studies", :id => false, :force => true do |t|
    t.binary   "uuid",                           :limit => 16, :null => false
    t.integer  "internal_id",                                  :null => false
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
    t.boolean  "is_current",                                   :null => false
    t.datetime "checked_at",                                   :null => false
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
    t.string   "data_release_timing"
    t.string   "data_release_delay_period"
    t.string   "data_release_delay_reason"
  end

  add_index "current_studies", ["accession_number"], :name => "accession_number_idx"
  add_index "current_studies", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_studies", ["name"], :name => "name_idx"
  add_index "current_studies", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_study_samples", :id => false, :force => true do |t|
    t.binary   "uuid",               :limit => 16, :null => false
    t.integer  "internal_id",                      :null => false
    t.integer  "sample_internal_id"
    t.binary   "sample_uuid",        :limit => 16
    t.integer  "study_internal_id"
    t.binary   "study_uuid",         :limit => 16
    t.boolean  "is_current",                       :null => false
    t.datetime "checked_at",                       :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                     :null => false
    t.datetime "current_to"
  end

  add_index "current_study_samples", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_study_samples", ["sample_internal_id", "study_internal_id"], :name => "sample_internal_id_study_internal_id_idx"
  add_index "current_study_samples", ["sample_uuid", "study_internal_id"], :name => "sample_uuid_study_internal_id_idx"
  add_index "current_study_samples", ["study_internal_id", "sample_internal_id"], :name => "study_internal_id_sample_internal_id_idx"
  add_index "current_study_samples", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_submissions", :id => false, :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id",                :null => false
    t.boolean  "is_current",                 :null => false
    t.datetime "checked_at",                 :null => false
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

  add_index "current_submissions", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_submissions", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_tags", :id => false, :force => true do |t|
    t.binary   "uuid",                  :limit => 16, :null => false
    t.integer  "internal_id",                         :null => false
    t.string   "expected_sequence"
    t.integer  "map_id"
    t.string   "tag_group_name"
    t.binary   "tag_group_uuid",        :limit => 16
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current",                          :null => false
    t.datetime "checked_at",                          :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                        :null => false
    t.datetime "current_to"
  end

  add_index "current_tags", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_tags", ["map_id", "internal_id"], :name => "map_id_internal_id_idx"
  add_index "current_tags", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "current_wells", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                                :null => false
    t.integer  "internal_id",                                                          :null => false
    t.string   "name"
    t.string   "map",                     :limit => 5
    t.string   "plate_barcode"
    t.string   "plate_barcode_prefix",    :limit => 2
    t.binary   "sample_uuid",             :limit => 16
    t.integer  "sample_internal_id"
    t.string   "sample_name"
    t.string   "gel_pass"
    t.decimal  "concentration",                         :precision => 10, :scale => 2
    t.float    "current_volume"
    t.float    "buffer_volume"
    t.float    "requested_volume"
    t.float    "picked_volume"
    t.string   "pico_pass"
    t.boolean  "is_current",                                                           :null => false
    t.datetime "checked_at",                                                           :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.binary   "plate_uuid",              :limit => 16
    t.decimal  "measured_volume",                       :precision => 5,  :scale => 2
    t.integer  "sequenom_count"
    t.string   "gender_markers",          :limit => 40
    t.string   "genotyping_status"
    t.string   "genotyping_snp_plate_id"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                         :null => false
    t.datetime "current_to"
    t.string   "display_name",            :limit => 20
  end

  add_index "current_wells", ["inserted_at"], :name => "inserted_at_idx"
  add_index "current_wells", ["internal_id"], :name => "internal_id_idx", :unique => true
  add_index "current_wells", ["plate_barcode", "plate_barcode_prefix", "map"], :name => "plate_barcode_plate_barcode_prefix_map_idx"
  add_index "current_wells", ["uuid"], :name => "uuid_idx", :unique => true

  create_table "events", :id => false, :force => true do |t|
    t.binary   "uuid",               :limit => 16, :null => false
    t.integer  "internal_id",                      :null => false
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
    t.boolean  "is_current",                       :null => false
    t.datetime "checked_at",                       :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                     :null => false
    t.datetime "current_to"
  end

  add_index "events", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "lanes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16, :null => false
    t.integer  "internal_id",                           :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.boolean  "external_release"
    t.boolean  "is_current",                            :null => false
    t.date     "scanned_in_date"
    t.datetime "checked_at",                            :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                          :null => false
    t.datetime "current_to"
  end

  add_index "lanes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "library_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                        :limit => 16,                                :null => false
    t.integer  "internal_id",                                                              :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",              :limit => 2
    t.boolean  "closed"
    t.string   "state",                       :limit => 50
    t.string   "two_dimensional_barcode"
    t.binary   "sample_uuid",                 :limit => 16
    t.integer  "sample_internal_id"
    t.decimal  "volume",                                    :precision => 5,  :scale => 2
    t.decimal  "concentration",                             :precision => 10, :scale => 2
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
    t.boolean  "is_current",                                                               :null => false
    t.date     "scanned_in_date"
    t.datetime "checked_at",                                                               :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                             :null => false
    t.datetime "current_to"
  end

  add_index "library_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "multiplexed_library_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                                :null => false
    t.integer  "internal_id",                                                          :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",          :limit => 2
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.decimal  "volume",                                :precision => 5,  :scale => 2
    t.decimal  "concentration",                         :precision => 10, :scale => 2
    t.boolean  "is_current",                                                           :null => false
    t.date     "scanned_in_date"
    t.datetime "checked_at",                                                           :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "public_name"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                         :null => false
    t.datetime "current_to"
  end

  add_index "multiplexed_library_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "orders", :id => false, :force => true do |t|
    t.binary   "uuid",                        :limit => 16, :null => false
    t.integer  "internal_id",                               :null => false
    t.boolean  "is_current",                                :null => false
    t.datetime "checked_at",                                :null => false
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

  add_index "orders", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "pac_bio_library_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                               :null => false
    t.integer  "internal_id",                                                         :null => false
    t.string   "name"
    t.string   "barcode_prefix",          :limit => 2
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.decimal  "volume",                                :precision => 5, :scale => 2
    t.decimal  "concentration",                         :precision => 5, :scale => 2
    t.date     "scanned_in_date"
    t.string   "public_name"
    t.string   "prep_kit_barcode"
    t.string   "binding_kit_barcode"
    t.string   "smrt_cells_available"
    t.string   "movie_length"
    t.string   "protocol"
    t.boolean  "is_current",                                                          :null => false
    t.datetime "checked_at",                                                          :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                        :null => false
    t.datetime "current_to"
  end

  add_index "pac_bio_library_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "plate_purposes", :id => false, :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id",                :null => false
    t.string   "name"
    t.boolean  "is_current",                 :null => false
    t.datetime "checked_at",                 :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",               :null => false
    t.datetime "current_to"
  end

  add_index "plate_purposes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "plates", :id => false, :force => true do |t|
    t.binary   "uuid",                      :limit => 16, :null => false
    t.integer  "internal_id",                             :null => false
    t.string   "name"
    t.string   "barcode"
    t.string   "barcode_prefix",            :limit => 2
    t.integer  "plate_size"
    t.boolean  "is_current",                              :null => false
    t.datetime "checked_at",                              :null => false
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

  add_index "plates", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "project_users", :force => true do |t|
    t.integer "project_internal_id",               :null => false
    t.binary  "project_uuid",        :limit => 16, :null => false
    t.string  "role",                              :null => false
    t.string  "login",                             :null => false
    t.string  "email"
    t.string  "name"
  end

  create_table "projects", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16, :null => false
    t.integer  "internal_id",                           :null => false
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
    t.boolean  "is_current",                            :null => false
    t.datetime "checked_at",                            :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                          :null => false
    t.datetime "current_to"
  end

  add_index "projects", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "quotas", :id => false, :force => true do |t|
    t.binary   "uuid",                :limit => 16, :null => false
    t.integer  "internal_id",                       :null => false
    t.integer  "quota_limit"
    t.string   "request_type"
    t.integer  "project_internal_id"
    t.binary   "project_uuid",        :limit => 16
    t.string   "project_name"
    t.boolean  "is_current",                        :null => false
    t.datetime "checked_at",                        :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                      :null => false
    t.datetime "current_to"
  end

  add_index "quotas", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "requests", :id => false, :force => true do |t|
    t.binary   "uuid",                                 :limit => 16, :null => false
    t.integer  "internal_id",                                        :null => false
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
    t.boolean  "is_current",                                         :null => false
    t.datetime "checked_at",                                         :null => false
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

  add_index "requests", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "sample_tubes", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                                :null => false
    t.integer  "internal_id",                                                          :null => false
    t.string   "name"
    t.string   "barcode"
    t.boolean  "closed"
    t.string   "state",                   :limit => 50
    t.string   "two_dimensional_barcode"
    t.binary   "sample_uuid",             :limit => 16
    t.integer  "sample_internal_id"
    t.string   "sample_name"
    t.date     "scanned_in_date"
    t.decimal  "volume",                                :precision => 5,  :scale => 2
    t.decimal  "concentration",                         :precision => 10, :scale => 2
    t.boolean  "is_current",                                                           :null => false
    t.datetime "checked_at",                                                           :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.string   "barcode_prefix",          :limit => 2
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                         :null => false
    t.datetime "current_to"
  end

  add_index "sample_tubes", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "samples", :id => false, :force => true do |t|
    t.binary   "uuid",                       :limit => 16,                    :null => false
    t.integer  "internal_id",                                                 :null => false
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
    t.boolean  "is_current",                                                  :null => false
    t.datetime "checked_at",                                                  :null => false
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
    t.datetime "current_from",                                                :null => false
    t.datetime "current_to"
    t.boolean  "consent_withdrawn",                        :default => false, :null => false
  end

  add_index "samples", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "studies", :id => false, :force => true do |t|
    t.binary   "uuid",                           :limit => 16, :null => false
    t.integer  "internal_id",                                  :null => false
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
    t.boolean  "is_current",                                   :null => false
    t.datetime "checked_at",                                   :null => false
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
    t.string   "data_release_timing"
    t.string   "data_release_delay_period"
    t.string   "data_release_delay_reason"
  end

  add_index "studies", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "study_samples", :id => false, :force => true do |t|
    t.binary   "uuid",               :limit => 16, :null => false
    t.integer  "internal_id",                      :null => false
    t.integer  "sample_internal_id"
    t.binary   "sample_uuid",        :limit => 16
    t.integer  "study_internal_id"
    t.binary   "study_uuid",         :limit => 16
    t.boolean  "is_current",                       :null => false
    t.datetime "checked_at",                       :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                     :null => false
    t.datetime "current_to"
  end

  add_index "study_samples", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "study_users", :force => true do |t|
    t.integer "study_internal_id",               :null => false
    t.binary  "study_uuid",        :limit => 16, :null => false
    t.string  "role",                            :null => false
    t.string  "login",                           :null => false
    t.string  "email"
    t.string  "name"
  end

  create_table "submissions", :id => false, :force => true do |t|
    t.binary   "uuid",         :limit => 16, :null => false
    t.integer  "internal_id",                :null => false
    t.boolean  "is_current",                 :null => false
    t.datetime "checked_at",                 :null => false
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

  add_index "submissions", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "submitted_assets", :primary_key => "dont_use_id", :force => true do |t|
    t.binary   "order_uuid", :limit => 16
    t.binary   "asset_uuid", :limit => 16
    t.datetime "deleted_at"
  end

  add_index "submitted_assets", ["order_uuid", "asset_uuid"], :name => "submission_uuid_and_asset_uuid_idx"

  create_table "tags", :id => false, :force => true do |t|
    t.binary   "uuid",                  :limit => 16, :null => false
    t.integer  "internal_id",                         :null => false
    t.string   "expected_sequence"
    t.integer  "map_id"
    t.string   "tag_group_name"
    t.binary   "tag_group_uuid",        :limit => 16
    t.integer  "tag_group_internal_id"
    t.boolean  "is_current",                          :null => false
    t.datetime "checked_at",                          :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                        :null => false
    t.datetime "current_to"
  end

  add_index "tags", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_table "wells", :id => false, :force => true do |t|
    t.binary   "uuid",                    :limit => 16,                                :null => false
    t.integer  "internal_id",                                                          :null => false
    t.string   "name"
    t.string   "map",                     :limit => 5
    t.string   "plate_barcode"
    t.string   "plate_barcode_prefix",    :limit => 2
    t.binary   "sample_uuid",             :limit => 16
    t.integer  "sample_internal_id"
    t.string   "sample_name"
    t.string   "gel_pass"
    t.decimal  "concentration",                         :precision => 10, :scale => 2
    t.float    "current_volume"
    t.float    "buffer_volume"
    t.float    "requested_volume"
    t.float    "picked_volume"
    t.string   "pico_pass"
    t.boolean  "is_current",                                                           :null => false
    t.datetime "checked_at",                                                           :null => false
    t.datetime "last_updated"
    t.datetime "created"
    t.binary   "plate_uuid",              :limit => 16
    t.decimal  "measured_volume",                       :precision => 5,  :scale => 2
    t.integer  "sequenom_count"
    t.string   "gender_markers",          :limit => 40
    t.string   "genotyping_status"
    t.string   "genotyping_snp_plate_id"
    t.datetime "inserted_at"
    t.datetime "deleted_at"
    t.datetime "current_from",                                                         :null => false
    t.datetime "current_to"
    t.string   "display_name",            :limit => 20
  end

  add_index "wells", ["uuid", "current_from", "current_to"], :name => "uuid_and_current_from_and_current_to_idx", :unique => true

  create_view "uuid_objects", "(select `current_aliquots`.`uuid` AS `uuid`,hex(`current_aliquots`.`uuid`) AS `decoded_uuid`,`current_aliquots`.`checked_at` AS `object_name`,`current_aliquots`.`last_updated` AS `internal_id`,`current_aliquots`.`created` AS `name`,0 AS `checked_at`,NULL AS `created`,NULL AS `last_updated`,'aliquots' AS `deleted` from `current_aliquots`) union (select `current_asset_audits`.`uuid` AS `uuid`,hex(`current_asset_audits`.`uuid`) AS `decoded_uuid`,`current_asset_audits`.`checked_at` AS `checked_at`,`current_asset_audits`.`last_updated` AS `last_updated`,`current_asset_audits`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'asset_audits' AS `object_name` from `current_asset_audits`) union (select `current_asset_links`.`uuid` AS `uuid`,hex(`current_asset_links`.`uuid`) AS `decoded_uuid`,`current_asset_links`.`checked_at` AS `checked_at`,`current_asset_links`.`last_updated` AS `last_updated`,`current_asset_links`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'asset_links' AS `object_name` from `current_asset_links`) union (select `current_batch_requests`.`uuid` AS `uuid`,hex(`current_batch_requests`.`uuid`) AS `decoded_uuid`,`current_batch_requests`.`checked_at` AS `checked_at`,`current_batch_requests`.`last_updated` AS `last_updated`,`current_batch_requests`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'batch_requests' AS `object_name` from `current_batch_requests`) union (select `current_batches`.`uuid` AS `uuid`,hex(`current_batches`.`uuid`) AS `decoded_uuid`,`current_batches`.`checked_at` AS `checked_at`,`current_batches`.`last_updated` AS `last_updated`,`current_batches`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'batches' AS `object_name` from `current_batches`) union (select `current_billing_events`.`uuid` AS `uuid`,hex(`current_billing_events`.`uuid`) AS `decoded_uuid`,`current_billing_events`.`checked_at` AS `checked_at`,`current_billing_events`.`last_updated` AS `last_updated`,`current_billing_events`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'billing_events' AS `object_name` from `current_billing_events`) union (select `current_events`.`uuid` AS `uuid`,hex(`current_events`.`uuid`) AS `decoded_uuid`,`current_events`.`checked_at` AS `checked_at`,`current_events`.`last_updated` AS `last_updated`,`current_events`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'events' AS `object_name` from `current_events`) union (select `current_lanes`.`uuid` AS `uuid`,hex(`current_lanes`.`uuid`) AS `decoded_uuid`,`current_lanes`.`checked_at` AS `checked_at`,`current_lanes`.`last_updated` AS `last_updated`,`current_lanes`.`created` AS `created`,0 AS `deleted`,`current_lanes`.`name` AS `name`,`current_lanes`.`internal_id` AS `internal_id`,'lanes' AS `object_name` from `current_lanes`) union (select `current_library_tubes`.`uuid` AS `uuid`,hex(`current_library_tubes`.`uuid`) AS `decoded_uuid`,`current_library_tubes`.`checked_at` AS `checked_at`,`current_library_tubes`.`last_updated` AS `last_updated`,`current_library_tubes`.`created` AS `created`,0 AS `deleted`,`current_library_tubes`.`name` AS `name`,`current_library_tubes`.`internal_id` AS `internal_id`,'library_tubes' AS `object_name` from `current_library_tubes`) union (select `current_multiplexed_library_tubes`.`uuid` AS `uuid`,hex(`current_multiplexed_library_tubes`.`uuid`) AS `decoded_uuid`,`current_multiplexed_library_tubes`.`checked_at` AS `checked_at`,`current_multiplexed_library_tubes`.`last_updated` AS `last_updated`,`current_multiplexed_library_tubes`.`created` AS `created`,0 AS `deleted`,`current_multiplexed_library_tubes`.`name` AS `name`,`current_multiplexed_library_tubes`.`internal_id` AS `internal_id`,'multiplexed_library_tubes' AS `object_name` from `current_multiplexed_library_tubes`) union (select `current_plate_purposes`.`uuid` AS `uuid`,hex(`current_plate_purposes`.`uuid`) AS `decoded_uuid`,`current_plate_purposes`.`checked_at` AS `checked_at`,`current_plate_purposes`.`last_updated` AS `last_updated`,`current_plate_purposes`.`created` AS `created`,0 AS `deleted`,`current_plate_purposes`.`name` AS `name`,NULL AS `internal_id`,'plate_purposes' AS `object_name` from `current_plate_purposes`) union (select `current_plates`.`uuid` AS `uuid`,hex(`current_plates`.`uuid`) AS `decoded_uuid`,`current_plates`.`checked_at` AS `checked_at`,`current_plates`.`last_updated` AS `last_updated`,`current_plates`.`created` AS `created`,0 AS `deleted`,`current_plates`.`name` AS `name`,`current_plates`.`internal_id` AS `internal_id`,'plates' AS `object_name` from `current_plates`) union (select `current_projects`.`uuid` AS `uuid`,hex(`current_projects`.`uuid`) AS `decoded_uuid`,`current_projects`.`checked_at` AS `checked_at`,`current_projects`.`last_updated` AS `last_updated`,`current_projects`.`created` AS `created`,0 AS `deleted`,`current_projects`.`name` AS `name`,`current_projects`.`internal_id` AS `internal_id`,'projects' AS `object_name` from `current_projects`) union (select `current_quotas`.`uuid` AS `uuid`,hex(`current_quotas`.`uuid`) AS `decoded_uuid`,`current_quotas`.`checked_at` AS `checked_at`,`current_quotas`.`last_updated` AS `last_updated`,`current_quotas`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'quotas' AS `object_name` from `current_quotas`) union (select `current_requests`.`uuid` AS `uuid`,hex(`current_requests`.`uuid`) AS `decoded_uuid`,`current_requests`.`checked_at` AS `checked_at`,`current_requests`.`last_updated` AS `last_updated`,`current_requests`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,`current_requests`.`internal_id` AS `internal_id`,'requests' AS `object_name` from `current_requests`) union (select `current_sample_tubes`.`uuid` AS `uuid`,hex(`current_sample_tubes`.`uuid`) AS `decoded_uuid`,`current_sample_tubes`.`checked_at` AS `checked_at`,`current_sample_tubes`.`last_updated` AS `last_updated`,`current_sample_tubes`.`created` AS `created`,0 AS `deleted`,`current_sample_tubes`.`name` AS `name`,`current_sample_tubes`.`internal_id` AS `internal_id`,'sample_tubes' AS `object_name` from `current_sample_tubes`) union (select `current_samples`.`uuid` AS `uuid`,hex(`current_samples`.`uuid`) AS `decoded_uuid`,`current_samples`.`checked_at` AS `checked_at`,`current_samples`.`last_updated` AS `last_updated`,`current_samples`.`created` AS `created`,0 AS `deleted`,`current_samples`.`name` AS `name`,`current_samples`.`internal_id` AS `internal_id`,'samples' AS `object_name` from `current_samples`) union (select `current_studies`.`uuid` AS `uuid`,hex(`current_studies`.`uuid`) AS `decoded_uuid`,`current_studies`.`checked_at` AS `checked_at`,`current_studies`.`last_updated` AS `last_updated`,`current_studies`.`created` AS `created`,0 AS `deleted`,`current_studies`.`name` AS `name`,`current_studies`.`internal_id` AS `internal_id`,'studies' AS `object_name` from `current_studies`) union (select `current_submissions`.`uuid` AS `uuid`,hex(`current_submissions`.`uuid`) AS `decoded_uuid`,`current_submissions`.`checked_at` AS `checked_at`,`current_submissions`.`last_updated` AS `last_updated`,`current_submissions`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,`current_submissions`.`internal_id` AS `internal_id`,'submissions' AS `object_name` from `current_submissions`) union (select `current_tags`.`uuid` AS `uuid`,hex(`current_tags`.`uuid`) AS `decoded_uuid`,`current_tags`.`checked_at` AS `checked_at`,`current_tags`.`last_updated` AS `last_updated`,`current_tags`.`created` AS `created`,0 AS `deleted`,NULL AS `name`,NULL AS `internal_id`,'tags' AS `object_name` from `current_tags`) union (select `current_wells`.`uuid` AS `uuid`,hex(`current_wells`.`uuid`) AS `decoded_uuid`,`current_wells`.`checked_at` AS `checked_at`,`current_wells`.`last_updated` AS `last_updated`,`current_wells`.`created` AS `created`,0 AS `deleted`,`current_wells`.`name` AS `name`,`current_wells`.`internal_id` AS `internal_id`,'wells' AS `object_name` from `current_wells`)", :force => true do |v|
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

  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_aliquots WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_aliquots(`uuid`,`internal_id`,`receptacle_uuid`,`receptacle_internal_id`,`study_uuid`,`study_internal_id`,`project_uuid`,`project_internal_id`,`library_uuid`,`library_internal_id`,`sample_uuid`,`sample_internal_id`,`tag_uuid`,`tag_internal_id`,`receptacle_type`,`library_type`,`insert_size_from`,`insert_size_to`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`,`bait_name`,`bait_target_species`,`bait_supplier_identifier`,`bait_supplier_name`) VALUES(NEW.uuid,NEW.internal_id,NEW.receptacle_uuid,NEW.receptacle_internal_id,NEW.study_uuid,NEW.study_internal_id,NEW.project_uuid,NEW.project_internal_id,NEW.library_uuid,NEW.library_internal_id,NEW.sample_uuid,NEW.sample_internal_id,NEW.tag_uuid,NEW.tag_internal_id,NEW.receptacle_type,NEW.library_type,NEW.insert_size_from,NEW.insert_size_to,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to,NEW.bait_name,NEW.bait_target_species,NEW.bait_supplier_identifier,NEW.bait_supplier_name);\n          END ; END IF ;\n        END", {:name=>"maintain_current_aliquots_trigger", :event=>:insert, :on=>"aliquots"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_asset_audits WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_asset_audits(`uuid`,`internal_id`,`key`,`message`,`created_by`,`is_current`,`checked_at`,`last_updated`,`created`,`asset_barcode`,`asset_barcode_prefix`,`asset_uuid`,`witnessed_by`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.key,NEW.message,NEW.created_by,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.asset_barcode,NEW.asset_barcode_prefix,NEW.asset_uuid,NEW.witnessed_by,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_asset_audits_trigger", :event=>:insert, :on=>"asset_audits"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_asset_links WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_asset_links(`uuid`,`ancestor_uuid`,`ancestor_internal_id`,`ancestor_type`,`descendant_uuid`,`descendant_internal_id`,`descendant_type`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.ancestor_uuid,NEW.ancestor_internal_id,NEW.ancestor_type,NEW.descendant_uuid,NEW.descendant_internal_id,NEW.descendant_type,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_asset_links_trigger", :event=>:insert, :on=>"asset_links"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_batch_requests WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_batch_requests(`uuid`,`internal_id`,`batch_uuid`,`batch_internal_id`,`request_uuid`,`request_internal_id`,`request_type`,`source_asset_uuid`,`source_asset_internal_id`,`source_asset_name`,`target_asset_uuid`,`target_asset_internal_id`,`target_asset_name`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.batch_uuid,NEW.batch_internal_id,NEW.request_uuid,NEW.request_internal_id,NEW.request_type,NEW.source_asset_uuid,NEW.source_asset_internal_id,NEW.source_asset_name,NEW.target_asset_uuid,NEW.target_asset_internal_id,NEW.target_asset_name,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_batch_requests_trigger", :event=>:insert, :on=>"batch_requests"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_batches WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_batches(`uuid`,`internal_id`,`created_by`,`assigned_to`,`pipeline_name`,`pipeline_uuid`,`pipeline_internal_id`,`state`,`qc_state`,`production_state`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.created_by,NEW.assigned_to,NEW.pipeline_name,NEW.pipeline_uuid,NEW.pipeline_internal_id,NEW.state,NEW.qc_state,NEW.production_state,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_batches_trigger", :event=>:insert, :on=>"batches"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_billing_events WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_billing_events(`uuid`,`internal_id`,`reference`,`project_internal_id`,`project_uuid`,`project_name`,`division`,`created_by`,`request_internal_id`,`request_uuid`,`request_type`,`library_type`,`cost_code`,`price`,`quantity`,`kind`,`description`,`is_current`,`entry_date`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`,`bait_library_type`) VALUES(NEW.uuid,NEW.internal_id,NEW.reference,NEW.project_internal_id,NEW.project_uuid,NEW.project_name,NEW.division,NEW.created_by,NEW.request_internal_id,NEW.request_uuid,NEW.request_type,NEW.library_type,NEW.cost_code,NEW.price,NEW.quantity,NEW.kind,NEW.description,NEW.is_current,NEW.entry_date,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to,NEW.bait_library_type);\n          END ; END IF ;\n        END", {:name=>"maintain_current_billing_events_trigger", :event=>:insert, :on=>"billing_events"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_events WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_events(`uuid`,`internal_id`,`source_internal_id`,`source_uuid`,`source_type`,`message`,`state`,`identifier`,`location`,`actioned`,`content`,`created_by`,`of_interest_to`,`descriptor_key`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.source_internal_id,NEW.source_uuid,NEW.source_type,NEW.message,NEW.state,NEW.identifier,NEW.location,NEW.actioned,NEW.content,NEW.created_by,NEW.of_interest_to,NEW.descriptor_key,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_events_trigger", :event=>:insert, :on=>"events"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_lanes WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_lanes(`uuid`,`internal_id`,`name`,`barcode`,`barcode_prefix`,`closed`,`state`,`two_dimensional_barcode`,`external_release`,`is_current`,`scanned_in_date`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.barcode,NEW.barcode_prefix,NEW.closed,NEW.state,NEW.two_dimensional_barcode,NEW.external_release,NEW.is_current,NEW.scanned_in_date,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_lanes_trigger", :event=>:insert, :on=>"lanes"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_library_tubes WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_library_tubes(`uuid`,`internal_id`,`name`,`barcode`,`barcode_prefix`,`closed`,`state`,`two_dimensional_barcode`,`sample_uuid`,`sample_internal_id`,`volume`,`concentration`,`tag_uuid`,`tag_internal_id`,`expected_sequence`,`tag_map_id`,`tag_group_name`,`tag_group_uuid`,`tag_group_internal_id`,`source_request_internal_id`,`source_request_uuid`,`library_type`,`fragment_size_required_from`,`fragment_size_required_to`,`sample_name`,`is_current`,`scanned_in_date`,`checked_at`,`last_updated`,`created`,`public_name`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.barcode,NEW.barcode_prefix,NEW.closed,NEW.state,NEW.two_dimensional_barcode,NEW.sample_uuid,NEW.sample_internal_id,NEW.volume,NEW.concentration,NEW.tag_uuid,NEW.tag_internal_id,NEW.expected_sequence,NEW.tag_map_id,NEW.tag_group_name,NEW.tag_group_uuid,NEW.tag_group_internal_id,NEW.source_request_internal_id,NEW.source_request_uuid,NEW.library_type,NEW.fragment_size_required_from,NEW.fragment_size_required_to,NEW.sample_name,NEW.is_current,NEW.scanned_in_date,NEW.checked_at,NEW.last_updated,NEW.created,NEW.public_name,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_library_tubes_trigger", :event=>:insert, :on=>"library_tubes"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_multiplexed_library_tubes WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_multiplexed_library_tubes(`uuid`,`internal_id`,`name`,`barcode`,`barcode_prefix`,`closed`,`state`,`two_dimensional_barcode`,`volume`,`concentration`,`is_current`,`scanned_in_date`,`checked_at`,`last_updated`,`created`,`public_name`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.barcode,NEW.barcode_prefix,NEW.closed,NEW.state,NEW.two_dimensional_barcode,NEW.volume,NEW.concentration,NEW.is_current,NEW.scanned_in_date,NEW.checked_at,NEW.last_updated,NEW.created,NEW.public_name,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_multiplexed_library_tubes_trigger", :event=>:insert, :on=>"multiplexed_library_tubes"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_orders WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_orders(`uuid`,`internal_id`,`is_current`,`checked_at`,`last_updated`,`created`,`created_by`,`template_name`,`study_name`,`study_uuid`,`project_name`,`project_uuid`,`comments`,`inserted_at`,`read_length`,`fragment_size_required_from`,`fragment_size_required_to`,`library_type`,`sequencing_type`,`insert_size`,`number_of_lanes`,`submission_uuid`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.created_by,NEW.template_name,NEW.study_name,NEW.study_uuid,NEW.project_name,NEW.project_uuid,NEW.comments,NEW.inserted_at,NEW.read_length,NEW.fragment_size_required_from,NEW.fragment_size_required_to,NEW.library_type,NEW.sequencing_type,NEW.insert_size,NEW.number_of_lanes,NEW.submission_uuid,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_orders_trigger", :event=>:insert, :on=>"orders"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_pac_bio_library_tubes WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_pac_bio_library_tubes(`uuid`,`internal_id`,`name`,`barcode_prefix`,`barcode`,`closed`,`state`,`two_dimensional_barcode`,`volume`,`concentration`,`scanned_in_date`,`public_name`,`prep_kit_barcode`,`binding_kit_barcode`,`smrt_cells_available`,`movie_length`,`protocol`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.barcode_prefix,NEW.barcode,NEW.closed,NEW.state,NEW.two_dimensional_barcode,NEW.volume,NEW.concentration,NEW.scanned_in_date,NEW.public_name,NEW.prep_kit_barcode,NEW.binding_kit_barcode,NEW.smrt_cells_available,NEW.movie_length,NEW.protocol,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_pac_bio_library_tubes_trigger", :event=>:insert, :on=>"pac_bio_library_tubes"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_plate_purposes WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_plate_purposes(`uuid`,`internal_id`,`name`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_plate_purposes_trigger", :event=>:insert, :on=>"plate_purposes"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_plates WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_plates(`uuid`,`internal_id`,`name`,`barcode`,`barcode_prefix`,`plate_size`,`is_current`,`checked_at`,`last_updated`,`created`,`plate_purpose_name`,`plate_purpose_internal_id`,`plate_purpose_uuid`,`infinium_barcode`,`location`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.barcode,NEW.barcode_prefix,NEW.plate_size,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.plate_purpose_name,NEW.plate_purpose_internal_id,NEW.plate_purpose_uuid,NEW.infinium_barcode,NEW.location,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_plates_trigger", :event=>:insert, :on=>"plates"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_projects WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_projects(`uuid`,`internal_id`,`name`,`collaborators`,`funding_comments`,`cost_code`,`funding_model`,`approved`,`budget_division`,`external_funding_source`,`project_manager`,`budget_cost_centre`,`state`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.collaborators,NEW.funding_comments,NEW.cost_code,NEW.funding_model,NEW.approved,NEW.budget_division,NEW.external_funding_source,NEW.project_manager,NEW.budget_cost_centre,NEW.state,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_projects_trigger", :event=>:insert, :on=>"projects"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_quotas WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_quotas(`uuid`,`internal_id`,`quota_limit`,`request_type`,`project_internal_id`,`project_uuid`,`project_name`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.quota_limit,NEW.request_type,NEW.project_internal_id,NEW.project_uuid,NEW.project_name,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_quotas_trigger", :event=>:insert, :on=>"quotas"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_requests WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_requests(`uuid`,`internal_id`,`request_type`,`fragment_size_from`,`fragment_size_to`,`read_length`,`library_type`,`study_uuid`,`study_internal_id`,`study_name`,`project_uuid`,`project_internal_id`,`project_name`,`source_asset_uuid`,`source_asset_internal_id`,`source_asset_type`,`source_asset_name`,`source_asset_barcode`,`source_asset_barcode_prefix`,`source_asset_state`,`source_asset_closed`,`source_asset_two_dimensional_barcode`,`source_asset_sample_uuid`,`source_asset_sample_internal_id`,`target_asset_uuid`,`target_asset_internal_id`,`target_asset_type`,`target_asset_name`,`target_asset_barcode`,`target_asset_barcode_prefix`,`target_asset_state`,`target_asset_closed`,`target_asset_two_dimensional_barcode`,`target_asset_sample_uuid`,`target_asset_sample_internal_id`,`is_current`,`checked_at`,`last_updated`,`created`,`state`,`priority`,`user`,`inserted_at`,`deleted_at`,`submission_uuid`,`submission_internal_id`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.request_type,NEW.fragment_size_from,NEW.fragment_size_to,NEW.read_length,NEW.library_type,NEW.study_uuid,NEW.study_internal_id,NEW.study_name,NEW.project_uuid,NEW.project_internal_id,NEW.project_name,NEW.source_asset_uuid,NEW.source_asset_internal_id,NEW.source_asset_type,NEW.source_asset_name,NEW.source_asset_barcode,NEW.source_asset_barcode_prefix,NEW.source_asset_state,NEW.source_asset_closed,NEW.source_asset_two_dimensional_barcode,NEW.source_asset_sample_uuid,NEW.source_asset_sample_internal_id,NEW.target_asset_uuid,NEW.target_asset_internal_id,NEW.target_asset_type,NEW.target_asset_name,NEW.target_asset_barcode,NEW.target_asset_barcode_prefix,NEW.target_asset_state,NEW.target_asset_closed,NEW.target_asset_two_dimensional_barcode,NEW.target_asset_sample_uuid,NEW.target_asset_sample_internal_id,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.state,NEW.priority,NEW.user,NEW.inserted_at,NEW.deleted_at,NEW.submission_uuid,NEW.submission_internal_id,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_requests_trigger", :event=>:insert, :on=>"requests"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_sample_tubes WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_sample_tubes(`uuid`,`internal_id`,`name`,`barcode`,`closed`,`state`,`two_dimensional_barcode`,`sample_uuid`,`sample_internal_id`,`sample_name`,`scanned_in_date`,`volume`,`concentration`,`is_current`,`checked_at`,`last_updated`,`created`,`barcode_prefix`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.barcode,NEW.closed,NEW.state,NEW.two_dimensional_barcode,NEW.sample_uuid,NEW.sample_internal_id,NEW.sample_name,NEW.scanned_in_date,NEW.volume,NEW.concentration,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.barcode_prefix,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_sample_tubes_trigger", :event=>:insert, :on=>"sample_tubes"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_samples WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_samples(`uuid`,`internal_id`,`name`,`reference_genome`,`organism`,`accession_number`,`common_name`,`description`,`taxon_id`,`father`,`mother`,`replicate`,`ethnicity`,`gender`,`cohort`,`country_of_origin`,`geographical_region`,`is_current`,`checked_at`,`last_updated`,`created`,`sanger_sample_id`,`control`,`empty_supplier_sample_name`,`supplier_name`,`public_name`,`sample_visibility`,`strain`,`updated_by_manifest`,`inserted_at`,`deleted_at`,`current_from`,`current_to`,`consent_withdrawn`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.reference_genome,NEW.organism,NEW.accession_number,NEW.common_name,NEW.description,NEW.taxon_id,NEW.father,NEW.mother,NEW.replicate,NEW.ethnicity,NEW.gender,NEW.cohort,NEW.country_of_origin,NEW.geographical_region,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.sanger_sample_id,NEW.control,NEW.empty_supplier_sample_name,NEW.supplier_name,NEW.public_name,NEW.sample_visibility,NEW.strain,NEW.updated_by_manifest,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to,NEW.consent_withdrawn);\n          END ; END IF ;\n        END", {:name=>"maintain_current_samples_trigger", :event=>:insert, :on=>"samples"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_studies WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_studies(`uuid`,`internal_id`,`name`,`reference_genome`,`ethically_approved`,`faculty_sponsor`,`state`,`study_type`,`abstract`,`abbreviation`,`accession_number`,`description`,`is_current`,`checked_at`,`last_updated`,`created`,`contains_human_dna`,`contaminated_human_dna`,`data_release_strategy`,`data_release_sort_of_study`,`ena_project_id`,`study_title`,`study_visibility`,`ega_dac_accession_number`,`array_express_accession_number`,`ega_policy_accession_number`,`inserted_at`,`deleted_at`,`current_from`,`current_to`,`data_release_timing`,`data_release_delay_period`,`data_release_delay_reason`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.reference_genome,NEW.ethically_approved,NEW.faculty_sponsor,NEW.state,NEW.study_type,NEW.abstract,NEW.abbreviation,NEW.accession_number,NEW.description,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.contains_human_dna,NEW.contaminated_human_dna,NEW.data_release_strategy,NEW.data_release_sort_of_study,NEW.ena_project_id,NEW.study_title,NEW.study_visibility,NEW.ega_dac_accession_number,NEW.array_express_accession_number,NEW.ega_policy_accession_number,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to,NEW.data_release_timing,NEW.data_release_delay_period,NEW.data_release_delay_reason);\n          END ; END IF ;\n        END", {:name=>"maintain_current_studies_trigger", :event=>:insert, :on=>"studies"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_study_samples WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_study_samples(`uuid`,`internal_id`,`sample_internal_id`,`sample_uuid`,`study_internal_id`,`study_uuid`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.sample_internal_id,NEW.sample_uuid,NEW.study_internal_id,NEW.study_uuid,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_study_samples_trigger", :event=>:insert, :on=>"study_samples"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_submissions WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_submissions(`uuid`,`internal_id`,`is_current`,`checked_at`,`last_updated`,`created`,`created_by`,`state`,`message`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.created_by,NEW.state,NEW.message,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_submissions_trigger", :event=>:insert, :on=>"submissions"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_tags WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_tags(`uuid`,`internal_id`,`expected_sequence`,`map_id`,`tag_group_name`,`tag_group_uuid`,`tag_group_internal_id`,`is_current`,`checked_at`,`last_updated`,`created`,`inserted_at`,`deleted_at`,`current_from`,`current_to`) VALUES(NEW.uuid,NEW.internal_id,NEW.expected_sequence,NEW.map_id,NEW.tag_group_name,NEW.tag_group_uuid,NEW.tag_group_internal_id,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to);\n          END ; END IF ;\n        END", {:name=>"maintain_current_tags_trigger", :event=>:insert, :on=>"tags"})
  after_trigger("BEGIN\n          IF NEW.current_to IS NULL OR NEW.deleted_at IS NOT NULL THEN BEGIN\n            DELETE FROM current_wells WHERE uuid=NEW.uuid;\n          END ; END IF ;\n          IF NEW.current_to IS NULL THEN BEGIN\n            INSERT INTO current_wells(`uuid`,`internal_id`,`name`,`map`,`plate_barcode`,`plate_barcode_prefix`,`sample_uuid`,`sample_internal_id`,`sample_name`,`gel_pass`,`concentration`,`current_volume`,`buffer_volume`,`requested_volume`,`picked_volume`,`pico_pass`,`is_current`,`checked_at`,`last_updated`,`created`,`plate_uuid`,`measured_volume`,`sequenom_count`,`gender_markers`,`genotyping_status`,`genotyping_snp_plate_id`,`inserted_at`,`deleted_at`,`current_from`,`current_to`,`display_name`) VALUES(NEW.uuid,NEW.internal_id,NEW.name,NEW.map,NEW.plate_barcode,NEW.plate_barcode_prefix,NEW.sample_uuid,NEW.sample_internal_id,NEW.sample_name,NEW.gel_pass,NEW.concentration,NEW.current_volume,NEW.buffer_volume,NEW.requested_volume,NEW.picked_volume,NEW.pico_pass,NEW.is_current,NEW.checked_at,NEW.last_updated,NEW.created,NEW.plate_uuid,NEW.measured_volume,NEW.sequenom_count,NEW.gender_markers,NEW.genotyping_status,NEW.genotyping_snp_plate_id,NEW.inserted_at,NEW.deleted_at,NEW.current_from,NEW.current_to,NEW.display_name);\n          END ; END IF ;\n        END", {:name=>"maintain_current_wells_trigger", :event=>:insert, :on=>"wells"})

end
