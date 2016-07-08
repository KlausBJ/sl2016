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

ActiveRecord::Schema.define(version: 20160703094827) do

  create_table "activities", force: :cascade do |t|
    t.string   "navn",            limit: 255
    t.string   "sted",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "registration_id", limit: 4
    t.datetime "tid"
  end

  add_index "activities", ["registration_id"], name: "index_activities_on_registration_id", using: :btree

  create_table "assignments", force: :cascade do |t|
    t.integer  "task_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "registration_id", limit: 4
  end

  add_index "assignments", ["registration_id"], name: "index_assignments_on_registration_id", using: :btree
  add_index "assignments", ["task_id"], name: "index_assignments_on_task_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.string   "email",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "member_id",      limit: 4,   null: false
    t.integer  "ticket_type_id", limit: 4,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "aargang",        limit: 4
    t.string   "email",          limit: 255
    t.integer  "vmn",            limit: 4
    t.string   "indkvartering",  limit: 255
    t.string   "koen",           limit: 255
    t.string   "mobil",          limit: 255
  end

  add_index "registrations", ["member_id"], name: "index_registrations_on_member_id", using: :btree
  add_index "registrations", ["ticket_type_id"], name: "index_registrations_on_ticket_type_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "number",      limit: 4
    t.datetime "date"
    t.integer  "activity_id", limit: 4
    t.string   "category",    limit: 255
    t.integer  "taken",       limit: 4,   default: 0
  end

  add_index "tasks", ["activity_id"], name: "index_tasks_on_activity_id", using: :btree

  create_table "ticket_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "activity_id",     limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "registration_id", limit: 4
    t.string   "name",            limit: 255
  end

  add_index "tickets", ["activity_id"], name: "index_tickets_on_activity_id", using: :btree
  add_index "tickets", ["registration_id"], name: "index_tickets_on_registration_id", using: :btree

  add_foreign_key "activities", "registrations"
  add_foreign_key "assignments", "registrations"
  add_foreign_key "assignments", "tasks"
  add_foreign_key "registrations", "members"
  add_foreign_key "registrations", "ticket_types"
  add_foreign_key "tasks", "activities"
  add_foreign_key "tickets", "activities"
  add_foreign_key "tickets", "registrations"
end
