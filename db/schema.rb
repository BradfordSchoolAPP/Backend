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

ActiveRecord::Schema.define(version: 2018_11_18_180734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "year_course"
    t.string "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices_parents", id: false, force: :cascade do |t|
    t.bigint "device_id"
    t.bigint "parent_id"
    t.index ["device_id"], name: "index_devices_parents_on_device_id"
    t.index ["parent_id"], name: "index_devices_parents_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.integer "phone_number"
    t.boolean "recv_notifications"
    t.boolean "active_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents_logs", force: :cascade do |t|
    t.text "detail"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_parents_logs_on_parent_id"
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "student_id"
    t.index ["parent_id"], name: "index_parents_students_on_parent_id"
    t.index ["student_id"], name: "index_parents_students_on_student_id"
  end

  create_table "parents_user_types", id: false, force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "user_type_id"
    t.index ["parent_id"], name: "index_parents_user_types_on_parent_id"
    t.index ["user_type_id"], name: "index_parents_user_types_on_user_type_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_students_on_course_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.text "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "devices_parents", "devices"
  add_foreign_key "devices_parents", "parents"
  add_foreign_key "parents_logs", "parents"
  add_foreign_key "parents_students", "parents"
  add_foreign_key "parents_students", "students"
  add_foreign_key "parents_user_types", "parents"
  add_foreign_key "parents_user_types", "user_types"
  add_foreign_key "students", "courses"
end
