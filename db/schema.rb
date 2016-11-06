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

ActiveRecord::Schema.define(version: 20161103133314) do

  create_table "addresses", force: :cascade do |t|
    t.string   "building_name"
    t.integer  "village_id"
    t.integer  "distric_id"
    t.integer  "provincial_id"
    t.integer  "addressale_kind"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "addresses", ["distric_id"], name: "index_addresses_on_distric_id"
  add_index "addresses", ["provincial_id"], name: "index_addresses_on_provincial_id"
  add_index "addresses", ["village_id"], name: "index_addresses_on_village_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["hotel_id"], name: "index_comments_on_hotel_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "districs", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.integer  "provincial_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "districs", ["provincial_id"], name: "index_districs_on_provincial_id"

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.integer  "address_id"
    t.integer  "countRoom"
    t.text     "introduction"
    t.string   "kind"
    t.decimal  "price"
    t.string   "phone_number"
    t.string   "websitehotel"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hotels", ["address_id"], name: "index_hotels_on_address_id"

  create_table "images", force: :cascade do |t|
    t.integer  "hotel_id"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["hotel_id"], name: "index_images_on_hotel_id"

  create_table "provincials", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "picture"
    t.datetime "birthday"
    t.integer  "gender"
    t.string   "address"
    t.string   "state"
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "villages", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.integer  "distric_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "villages", ["distric_id"], name: "index_villages_on_distric_id"

end
