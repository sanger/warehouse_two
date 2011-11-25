class AddOrder < ActiveRecord::Migration
  def self.up

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
  add_index "orders", ["created"]
  add_index "orders", ["internal_id"]
  add_index "orders", ["last_updated"]
  add_index "orders", ["project_uuid"]
  add_index "orders", ["study_uuid"]
  add_index "orders", ["uuid"]
  end

  def self.down
  drop_table "orders"

  end
end
