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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141222163701) do

  create_table "issues", force: true do |t|
    t.integer  "comicvineid"
    t.integer  "volume_id"
    t.string   "name"
    t.integer  "issue_number"
    t.date     "store_date"
    t.date     "cover_date"
    t.string   "api_detail_url"
    t.string   "site_detail_url"
    t.string   "image_url"
    t.text     "description"
    t.integer  "status",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["comicvineid"], name: "index_issues_on_comicvineid"
  add_index "issues", ["issue_number"], name: "index_issues_on_issue_number"
  add_index "issues", ["volume_id"], name: "index_issues_on_volume_id"

  create_table "libraries", force: true do |t|
    t.integer  "user_id"
    t.integer  "volume_id"
    t.integer  "status",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "libraries", ["user_id"], name: "index_libraries_on_user_id"
  add_index "libraries", ["volume_id"], name: "index_libraries_on_volume_id"

  create_table "readlists", force: true do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "readlists", ["issue_id"], name: "index_readlists_on_issue_id"
  add_index "readlists", ["user_id"], name: "index_readlists_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "volumes", force: true do |t|
    t.integer  "comicvineid"
    t.string   "name"
    t.integer  "start_year"
    t.string   "api_detail_url"
    t.string   "site_detail_url"
    t.string   "image_url"
    t.string   "publisher_name"
    t.text     "description"
    t.integer  "status",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volumes", ["comicvineid"], name: "index_volumes_on_comicvineid"

end
