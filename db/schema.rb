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

ActiveRecord::Schema.define(version: 20150209172822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",               null: false
    t.string   "brand_id"
    t.string   "brand_filename"
    t.integer  "brand_size"
    t.string   "brand_content_type"
    t.string   "url",                null: false
  end

  add_index "clients", ["name"], name: "index_clients_on_name", unique: true, using: :btree
  add_index "clients", ["slug"], name: "index_clients_on_slug", unique: true, using: :btree

  create_table "covers", force: true do |t|
    t.string   "obra",               null: false
    t.string   "description",        null: false
    t.integer  "client_id"
    t.string   "image_id"
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "covers", ["client_id"], name: "index_covers_on_client_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "image_id"
    t.integer  "portfolio_project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_filename"
    t.integer  "image_size"
    t.string   "image_content_type"
    t.integer  "number_of_columns"
  end

  add_index "photos", ["portfolio_project_id"], name: "index_photos_on_portfolio_project_id", using: :btree

  create_table "portfolio_project_tags", force: true do |t|
    t.integer  "portfolio_project_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "portfolio_project_tags", ["portfolio_project_id"], name: "index_portfolio_project_tags_on_portfolio_project_id", using: :btree
  add_index "portfolio_project_tags", ["tag_id"], name: "index_portfolio_project_tags_on_tag_id", using: :btree

  create_table "portfolio_projects", force: true do |t|
    t.string   "name",                     null: false
    t.string   "detail",                   null: false
    t.string   "place",                    null: false
    t.integer  "area",                     null: false
    t.integer  "client_id"
    t.integer  "type_id"
    t.string   "slug",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_image_id"
    t.string   "cover_image_filename"
    t.integer  "cover_image_size"
    t.string   "cover_image_content_type"
    t.integer  "number_of_columns"
  end

  add_index "portfolio_projects", ["client_id"], name: "index_portfolio_projects_on_client_id", using: :btree
  add_index "portfolio_projects", ["slug"], name: "index_portfolio_projects_on_slug", unique: true, using: :btree
  add_index "portfolio_projects", ["type_id"], name: "index_portfolio_projects_on_type_id", using: :btree

  create_table "project_files", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "project_id"
    t.string   "project_file_id"
    t.string   "project_file_filename"
    t.integer  "project_file_size"
    t.string   "project_file_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_files", ["project_id"], name: "index_project_files_on_project_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",        null: false
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree
  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.string   "class_name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", force: true do |t|
    t.string   "name",               null: false
    t.string   "bio",                null: false
    t.string   "linkedin_url",       null: false
    t.string   "photo_id"
    t.string   "photo_filename"
    t.integer  "photo_size"
    t.string   "photo_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id", using: :btree
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
