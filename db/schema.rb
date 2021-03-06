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

ActiveRecord::Schema.define(version: 20151012115446) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "business_type"
    t.text     "outline"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.date     "date_on"
    t.text     "content"
    t.string   "means"
    t.string   "owner"
    t.integer  "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["lead_id"], name: "index_contacts_on_lead_id"

  create_table "event_leads", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_leads", ["event_id"], name: "index_event_leads_on_event_id"
  add_index "event_leads", ["lead_id"], name: "index_event_leads_on_lead_id"

  create_table "events", force: :cascade do |t|
    t.date     "date_on"
    t.string   "name"
    t.string   "category"
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.date     "date_on"
    t.string   "company_name"
    t.string   "department"
    t.string   "title"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "trigger"
    t.text     "memo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
