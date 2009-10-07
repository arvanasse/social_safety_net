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

ActiveRecord::Schema.define(:version => 20091007174209) do

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
