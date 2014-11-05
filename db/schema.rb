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

ActiveRecord::Schema.define(version: 20141105002744) do

  create_table "political_parties", force: true do |t|
    t.string   "name"
    t.string   "siglum"
    t.decimal  "number"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "political_party_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "political_party_id"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "politician_likes", force: true do |t|
    t.integer  "liker_id"
    t.integer  "liked_id"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "politician_likes", ["liked_id"], name: "index_politician_likes_on_liked_id"
  add_index "politician_likes", ["liker_id", "liked_id"], name: "index_politician_likes_on_liker_id_and_liked_id", unique: true
  add_index "politician_likes", ["liker_id"], name: "index_politician_likes_on_liker_id"

  create_table "post_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "city"
    t.string   "state"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.boolean  "politician"
    t.integer  "political_party_id"
    t.boolean  "admin",                        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
