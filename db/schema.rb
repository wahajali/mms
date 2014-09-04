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

ActiveRecord::Schema.define(version: 20140902082920) do

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "zip_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "center_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clinics", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "common_data", force: true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "legal_entity"
    t.string   "ownership"
    t.float    "assets_value"
    t.text     "facilities_details"
    t.date     "operating_since"
    t.text     "operating_business"
    t.string   "liabilities"
    t.integer  "manpower_strength"
    t.text     "manpower_details"
    t.integer  "center_type_id"
    t.integer  "entity_id"
    t.string   "entity_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "corporates", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "institutes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laboratories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manufacturings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicine_types", force: true do |t|
    t.string   "medicine_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicines", force: true do |t|
    t.string   "name"
    t.integer  "medicine_type_id"
    t.string   "purpose"
    t.string   "make"
    t.string   "manufacturer"
    t.string   "distributor"
    t.string   "approving_agency"
    t.string   "classification_type_1"
    t.string   "classification_type_2"
    t.text     "other_specifications"
    t.string   "form"
    t.string   "potency"
    t.integer  "first_packing_unit_qty"
    t.integer  "second_packing_unit_qty"
    t.integer  "third_packing_unit_qty"
    t.text     "storage_instructions"
    t.integer  "expiry_duration_months"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "card_no"
    t.date     "card_date"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fathers_name"
    t.string   "mothers_name"
    t.string   "husbands_name"
    t.date     "dob"
    t.string   "referred_by"
    t.string   "gender"
    t.string   "marital_status"
    t.string   "blood_group"
    t.string   "patient_type"
    t.string   "financial_type"
    t.string   "treatment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pharmacies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", force: true do |t|
    t.string   "number"
    t.string   "number_type"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tradings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trusts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
