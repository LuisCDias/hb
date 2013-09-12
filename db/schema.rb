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

ActiveRecord::Schema.define(version: 20130905123846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "musician_name"
    t.string   "name"
    t.integer  "requested_likes", default: 1
    t.integer  "musician_id"
    t.integer  "track_id"
  end

  add_index "campaigns", ["category_id"], name: "index_campaigns_on_category_id", using: :btree
  add_index "campaigns", ["musician_id"], name: "index_campaigns_on_musician_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "local_tracks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "soundcloud_id"
    t.string   "permalink_url"
    t.string   "download_url",  default: "Not available yet"
    t.string   "artwork_url",   default: "https://i1.sndcdn.com/artworks-000055452316-se7lpm-large.jpg?aa1a7cb"
    t.integer  "campaign_id"
  end

  add_index "local_tracks", ["campaign_id"], name: "index_local_tracks_on_campaign_id", using: :btree

  create_table "musicians", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "musicians", ["user_id"], name: "index_musicians_on_user_id", using: :btree

  create_table "reservations", force: true do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["campaign_id"], name: "index_reservations_on_campaign_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "soundcloud_accounts", force: true do |t|
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "soundcloud_avatar"
    t.string   "soundcloud_profile"
    t.string   "soundcloud_uid"
    t.string   "soundcloud_username"
    t.string   "token_expires"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "musician_id"
  end

  add_index "soundcloud_accounts", ["musician_id"], name: "index_soundcloud_accounts_on_musician_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "auth_provider"
    t.string   "auth_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
