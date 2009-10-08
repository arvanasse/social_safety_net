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

ActiveRecord::Schema.define(:version => 20091008163252) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "host"
    t.string   "state"
    t.string   "billing_status"
    t.date     "bill_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["bill_on"], :name => "index_accounts_on_bill_on"
  add_index "accounts", ["host"], :name => "index_accounts_on_host"

  create_table "case_histories", :force => true do |t|
    t.integer  "managed_case_id"
    t.integer  "parent_id"
    t.string   "state"
    t.date     "added_on"
    t.date     "due_on"
    t.date     "completed_on"
    t.integer  "detail_id"
    t.string   "detail_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "case_histories", ["detail_type", "managed_case_id"], :name => "index_case_histories_on_managed_case_id_and_detail_type"
  add_index "case_histories", ["due_on", "managed_case_id"], :name => "index_case_histories_on_managed_case_id_and_due_on"
  add_index "case_histories", ["managed_case_id", "state"], :name => "index_case_histories_on_managed_case_id_and_state"
  add_index "case_histories", ["managed_case_id"], :name => "index_case_histories_on_managed_case_id"

  create_table "cost_centers", :force => true do |t|
    t.integer  "account_id"
    t.string   "type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cost_centers", ["account_id", "name"], :name => "index_cost_centers_on_account_id_and_name"

  create_table "managed_cases", :force => true do |t|
    t.integer  "cost_center_id"
    t.integer  "parent_id"
    t.string   "state"
    t.string   "title"
    t.string   "reference"
    t.date     "opened_on"
    t.date     "closed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managed_cases", ["cost_center_id", "reference"], :name => "index_managed_cases_on_cost_center_id_and_reference"
  add_index "managed_cases", ["cost_center_id", "state"], :name => "index_managed_cases_on_cost_center_id_and_state"
  add_index "managed_cases", ["cost_center_id", "title"], :name => "index_managed_cases_on_cost_center_id_and_title"
  add_index "managed_cases", ["parent_id"], :name => "index_managed_cases_on_parent_id"

  create_table "users", :force => true do |t|
    t.string   "type"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "state"
    t.integer  "account_id"
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["account_id", "state"], :name => "index_users_on_account_id_and_state"
  add_index "users", ["email"], :name => "index_users_on_email"

end
