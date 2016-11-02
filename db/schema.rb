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

ActiveRecord::Schema.define(version: 20161102083500) do

  create_table "addresses", force: :cascade do |t|
    t.string   "building_name"
    t.integer  "addressale_id"
    t.integer  "addressale_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hotels_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["hotels_id"], name: "index_comments_on_hotels_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "districs", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "provincials_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "districs", ["provincials_id"], name: "index_districs_on_provincials_id"

  create_table "hotels", force: :cascade do |t|
    t.string   "name"
    t.integer  "addresses_id"
    t.integer  "countRoom"
    t.text     "introduction"
    t.string   "type"
    t.decimal  "price"
    t.string   "phone_number"
    t.string   "websitehotel"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hotels", ["addresses_id"], name: "index_hotels_on_addresses_id"

  create_table "images", force: :cascade do |t|
    t.integer  "hotels_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["hotels_id"], name: "index_images_on_hotels_id"

  create_table "provincials", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "picture"
    t.datetime "birthday"
    t.integer  "gender"
    t.string   "address"
    t.string   "state"
    t.string   "phone"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "villages", force: :cascade do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "districs_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "villages", ["districs_id"], name: "index_villages_on_districs_id"

end
