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

ActiveRecord::Schema.define(version: 20140923004848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rooms", force: true do |t|
    t.string   "hash_tag"
    t.string   "name"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["hash_tag"], name: "index_rooms_on_hash_tag", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.integer  "user_id",                 null: false
    t.integer  "room_id",                 null: false
    t.text     "text",                    null: false
    t.string   "hashtags",   default: [],              array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "screen_name"
    t.string   "name"
    t.string   "profile_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["screen_name"], name: "index_users_on_screen_name", unique: true, using: :btree

  add_foreign_key "tweets", "rooms", name: "tweets_room_id_fk"
  add_foreign_key "tweets", "users", name: "tweets_user_id_fk"

end
