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

ActiveRecord::Schema.define(version: 2018_05_04_100023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "authentications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "circles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name_ja", null: false
    t.string "name_en"
    t.string "circle_type", default: "general", null: false
    t.string "site_url"
    t.string "blog_url"
    t.string "category", null: false
    t.string "detail_category", null: false
    t.text "note_ja"
    t.text "note_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_ja"], name: "index_circles_on_name_ja", unique: true
  end

  create_table "event_series", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title_ja"
    t.string "title_en"
    t.integer "display_order", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title_ja", null: false
    t.string "title_en"
    t.string "display_title_ja", null: false
    t.string "display_title_en"
    t.uuid "event_series_id", null: false
    t.integer "times"
    t.integer "days", default: 1, null: false
    t.date "date"
    t.text "note_ja"
    t.text "note_en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_series_id"], name: "index_events_on_event_series_id"
  end

  create_table "original_songs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code", null: false
    t.string "title_ja"
    t.string "title_en"
    t.string "original_code", null: false
    t.string "composer"
    t.integer "track_number"
    t.boolean "is_duplicate", default: false, null: false
    t.boolean "is_hidden", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_original_songs_on_code", unique: true
    t.index ["original_code"], name: "index_original_songs_on_original_code"
  end

  create_table "originals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code", null: false
    t.string "title_ja"
    t.string "title_en"
    t.string "short_title_ja"
    t.string "short_title_en"
    t.string "original_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_originals_on_code", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_path"
    t.string "nick_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
