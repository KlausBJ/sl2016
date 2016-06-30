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

ActiveRecord::Schema.define(version: 20160630114052) do

  create_table "activities", force: :cascade do |t|
    t.string   "navn"
    t.string   "sted"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "registration_id"
    t.datetime "tid"
  end

  add_index "activities", ["registration_id"], name: "index_activities_on_registration_id"

  create_table "assignments", force: :cascade do |t|
    t.integer  "task_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "registration_id"
  end

  add_index "assignments", ["registration_id"], name: "index_assignments_on_registration_id"
  add_index "assignments", ["task_id"], name: "index_assignments_on_task_id"

  create_table "members", force: :cascade do |t|
    t.string   "number"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "registrations", force: :cascade do |t|
    t.string   "name"
    t.integer  "member_id",      null: false
    t.integer  "ticket_type_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "aargang"
    t.string   "email"
    t.integer  "vmn"
    t.string   "indkvartering"
    t.string   "koen"
    t.string   "mobil"
  end

  add_index "registrations", ["member_id"], name: "index_registrations_on_member_id"
  add_index "registrations", ["ticket_type_id"], name: "index_registrations_on_ticket_type_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "number"
    t.datetime "date"
    t.integer  "activity_id"
    t.string   "category"
  end

  add_index "tasks", ["activity_id"], name: "index_tasks_on_activity_id"

  create_table "ticket_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "activity_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "registration_id"
    t.string   "name"
  end

  add_index "tickets", ["activity_id"], name: "index_tickets_on_activity_id"
  add_index "tickets", ["registration_id"], name: "index_tickets_on_registration_id"

end
