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

ActiveRecord::Schema.define(version: 20170122182237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claims", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "amount"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "note"
    t.boolean  "private"
  end

  add_index "claims", ["post_id"], name: "index_claims_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "street_address"
    t.string   "zip"
    t.text     "description"
    t.text     "description_met"
    t.string   "picture"
    t.boolean  "facilitated_by_church"
    t.boolean  "anon_email"
    t.integer  "status",                default: 0
    t.integer  "category"
    t.integer  "flagged",               default: 0
    t.boolean  "show_phone"
    t.string   "email_key"
    t.string   "activation_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "email"
    t.string   "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "wants_rp"
    t.boolean  "wants_rh"
    t.boolean  "wants_op"
    t.boolean  "wants_oh"
  end

  add_foreign_key "claims", "posts"
end
