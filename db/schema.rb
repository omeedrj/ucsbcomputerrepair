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

ActiveRecord::Schema.define(version: 20150913044143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "repairs", force: :cascade do |t|
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "customer_id_number"
    t.string   "customer_email"
    t.string   "customer_phone_number"
    t.text     "device_description"
    t.string   "device_serial_number"
    t.string   "device_password"
    t.text     "accessories_description"
    t.text     "device_problem_description"
    t.text     "repair_description"
    t.decimal  "services_fee",               precision: 8, scale: 2, default: 0.0
    t.decimal  "parts_fee",                  precision: 8, scale: 2, default: 0.0
    t.integer  "status",                                             default: 0
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.string   "sales_associate"
    t.string   "technician"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "reset_digest"
    t.string   "username"
    t.integer  "role",            default: 1
    t.string   "website_code"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
