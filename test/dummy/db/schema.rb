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

ActiveRecord::Schema.define(version: 20160419223152) do

  create_table "contract_dependencies", force: :cascade do |t|
    t.string   "name"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scrutanize_audit_logs", force: :cascade do |t|
    t.string   "audit_type"
    t.string   "message"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "audit_report_id"
  end

  add_index "scrutanize_audit_logs", ["audit_report_id"], name: "index_scrutanize_audit_logs_on_audit_report_id"

  create_table "scrutanize_audit_reports", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.integer  "records_audited"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
