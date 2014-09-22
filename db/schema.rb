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

ActiveRecord::Schema.define(version: 20140917174355) do

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

  create_table "diseases", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.text     "qualification"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expense_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expense_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.date     "date"
    t.integer  "expense_category_id"
    t.string   "receipient"
    t.integer  "expense_type_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cost_centerable_id"
    t.integer  "cost_centerable_type"
  end

  create_table "family_histories", force: true do |t|
    t.integer  "disease_id"
    t.integer  "patient_id"
    t.string   "relation"
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
    t.string   "medication_type"
  end

  create_table "patient_records", force: true do |t|
    t.integer  "patient_id"
    t.date     "visit_date_islamic"
    t.date     "visit_date_english"
    t.string   "visit_day"
    t.integer  "doctor_id"
    t.string   "handling_person"
    t.float    "checked_weight"
    t.float    "checked_height"
    t.float    "checked_bp"
    t.integer  "no_of_children"
    t.integer  "youngest_child_age"
    t.string   "lscs"
    t.text     "diabetic_history"
    t.text     "present_complaint"
    t.text     "conducted_physical_examination"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "disease_id"
    t.text     "investigation_and_report"
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

  create_table "prescriptions", force: true do |t|
    t.integer  "medicine_id"
    t.integer  "patient_record_id"
    t.string   "dosage"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "previous_illnesses", force: true do |t|
    t.integer  "disease_id"
    t.integer  "patient_id"
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
