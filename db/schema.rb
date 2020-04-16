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

ActiveRecord::Schema.define(version: 2017_09_13_112831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.string "action"
    t.integer "user_id"
    t.string "user_email"
    t.integer "activity_object_id"
    t.string "object_text"
    t.string "object_url"
    t.integer "secondary_object_id"
    t.string "secondary_object_url"
    t.string "secondary_object_class"
    t.string "secondary_object_method"
    t.string "secondary_object_text"
    t.string "type"
    t.integer "library_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
    t.string "browser"
    t.datetime "deleted_at"
    t.string "location"
  end

  create_table "assets", id: :serial, force: :cascade do |t|
    t.string "filename"
    t.bigint "filesize"
    t.string "file_id"
    t.integer "file_type", default: 0
    t.integer "library_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uploader_id"
    t.integer "comments_count", default: 0
    t.datetime "soft_deleted_at"
    t.string "mime_type"
    t.string "title"
    t.index ["library_id"], name: "index_assets_on_library_id"
    t.index ["soft_deleted_at"], name: "index_assets_on_soft_deleted_at"
    t.index ["uploader_id"], name: "index_assets_on_uploader_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "comment"
    t.integer "asset_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["asset_id"], name: "index_comments_on_asset_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
  end

  create_table "libraries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assets_count", default: 0
    t.integer "creator_id"
    t.time "deleted_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.string "timezone"
    t.datetime "deleted_at"
  end

end
