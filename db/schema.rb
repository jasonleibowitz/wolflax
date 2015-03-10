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

ActiveRecord::Schema.define(version: 20150310183854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campers", force: true do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.integer "age"
    t.date    "dob"
    t.string  "street_address_one"
    t.string  "street_address_two"
    t.string  "city"
    t.string  "state"
    t.integer "zipcode"
    t.string  "team_name"
    t.string  "position"
    t.integer "experience"
    t.string  "email"
    t.string  "insurance_company_name"
    t.string  "insurance_policy_number"
    t.string  "insurance_policyholder"
    t.string  "mother_first_name"
    t.string  "mother_last_name"
    t.string  "mother_email"
    t.string  "father_first_name"
    t.string  "father_last_name"
    t.string  "father_email"
    t.boolean "waiver_signed"
    t.integer "camp_id"
    t.string  "stripe_charge_token"
    t.string  "mobile_phone"
    t.string  "mother_phone"
    t.string  "father_phone"
    t.string  "school"
    t.integer "grade"
    t.string  "referral"
  end

  create_table "camps", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.string   "location_name"
    t.string   "location_street_one"
    t.string   "location_street_two"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "starting_date"
    t.date     "ending_date"
    t.string   "list_id"
  end

  create_table "clinics", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "date_time"
    t.string   "location_name"
    t.string   "location_street_one"
    t.string   "location_street_two"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "total_spots"
    t.integer  "remaining_spots"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "clinics_users", force: true do |t|
    t.integer "clinic_id"
    t.integer "user_id"
  end

  create_table "students", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.integer "clinic_id"
    t.string  "stripe_charge_token"
    t.integer "age"
    t.string  "position"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
