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

ActiveRecord::Schema.define(version: 20141010103112) do

  create_table "awards", force: true do |t|
    t.integer  "job_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "group_name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.integer  "number"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
  end

  create_table "homeworks", force: true do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
    t.integer  "term_id"
    t.integer  "assignment_type"
  end

  create_table "jobs", force: true do |t|
    t.boolean  "done",        default: false
    t.integer  "homework_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "parent_id"
    t.string   "parent_type"
  end

  add_index "links", ["parent_id", "parent_type"], name: "index_links_on_parent_id_and_parent_type"

  create_table "notes", force: true do |t|
    t.boolean  "fixed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "submission_id"
    t.text     "text",          limit: 255
  end

  create_table "problems", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "homework_id"
    t.text     "text",        limit: 255
    t.integer  "number"
  end

  create_table "students", force: true do |t|
    t.integer  "user_id"
    t.integer  "term_id"
    t.boolean  "approved",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.text     "text",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.integer  "user_id"
    t.string   "file"
    t.integer  "version"
  end

  create_table "tasks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "problem_id"
    t.integer  "status",      default: 0
    t.integer  "homework_id"
    t.integer  "job_id"
  end

  create_table "terms", force: true do |t|
    t.integer  "course_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_type",              default: 0
    t.integer  "group_id"
    t.integer  "gender"
    t.boolean  "approved",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
