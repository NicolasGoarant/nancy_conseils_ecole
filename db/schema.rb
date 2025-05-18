# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_18_142717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "associations", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.bigint "user_id", null: false
    t.boolean "active", default: true
    t.datetime "assigned_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_associations_on_school_id"
    t.index ["user_id"], name: "index_associations_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "council_id", null: false
    t.bigint "user_id", null: false
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["council_id"], name: "index_attendances_on_council_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "councils", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "title"
    t.datetime "date"
    t.string "start_time"
    t.string "end_time"
    t.string "location"
    t.string "academic_year"
    t.integer "term"
    t.text "agenda"
    t.text "documents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_councils_on_school_id"
  end

  create_table "information", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.text "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_information_on_school_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "council_id", null: false
    t.bigint "user_id", null: false
    t.text "summary", null: false
    t.text "issues"
    t.text "follow_up"
    t.boolean "submitted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["council_id"], name: "index_reports_on_council_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "type"
    t.string "director_name"
    t.string "phone"
    t.string "email"
    t.integer "class_count"
    t.integer "student_count"
    t.integer "teacher_count"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.string "role"
    t.string "commission"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "associations", "schools"
  add_foreign_key "associations", "users"
  add_foreign_key "attendances", "councils"
  add_foreign_key "attendances", "users"
  add_foreign_key "councils", "schools"
  add_foreign_key "information", "schools"
  add_foreign_key "reports", "councils"
  add_foreign_key "reports", "users"
end
