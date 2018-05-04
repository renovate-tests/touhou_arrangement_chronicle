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

ActiveRecord::Schema.define(version: 2018_05_04_142932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "arrangers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_arrangers_on_artist_id", unique: true
  end

  create_table "artists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name_ja", null: false
    t.string "name_en"
    t.string "site_url"
    t.string "blog_url"
    t.text "note_ja"
    t.text "note_en"
    t.string "category", null: false
    t.string "detail_category", null: false
    t.uuid "circle_id"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_artists_on_circle_id"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

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

  create_table "composers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_composers_on_artist_id", unique: true
  end

  create_table "discographies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title_ja", null: false
    t.string "title_en"
    t.date "release_date"
    t.uuid "circle_id"
    t.uuid "event_id"
    t.integer "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_discographies_on_circle_id"
    t.index ["event_id"], name: "index_discographies_on_event_id"
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

  create_table "lyricists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_lyricists_on_artist_id", unique: true
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

  create_table "rearrangers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_rearrangers_on_artist_id", unique: true
  end

  create_table "song_arrangers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "song_id", null: false
    t.uuid "arranger_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arranger_id"], name: "index_song_arrangers_on_arranger_id"
    t.index ["song_id"], name: "index_song_arrangers_on_song_id"
  end

  create_table "song_lyricists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "song_id", null: false
    t.uuid "lyricist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lyricist_id"], name: "index_song_lyricists_on_lyricist_id"
    t.index ["song_id"], name: "index_song_lyricists_on_song_id"
  end

  create_table "song_vocalists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "song_id", null: false
    t.uuid "vocalist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_song_vocalists_on_song_id"
    t.index ["vocalist_id"], name: "index_song_vocalists_on_vocalist_id"
  end

  create_table "songs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title_ja", null: false
    t.string "title_en"
    t.integer "track_number"
    t.integer "length"
    t.integer "bpm"
    t.uuid "circle_id"
    t.uuid "discography_id"
    t.uuid "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_songs_on_circle_id"
    t.index ["discography_id"], name: "index_songs_on_discography_id"
    t.index ["event_id"], name: "index_songs_on_event_id"
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

  create_table "vocalists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_vocalists_on_artist_id", unique: true
  end

  add_foreign_key "arrangers", "artists"
  add_foreign_key "composers", "artists"
  add_foreign_key "lyricists", "artists"
  add_foreign_key "rearrangers", "artists"
  add_foreign_key "song_arrangers", "arrangers"
  add_foreign_key "song_arrangers", "songs"
  add_foreign_key "song_lyricists", "lyricists"
  add_foreign_key "song_lyricists", "songs"
  add_foreign_key "song_vocalists", "songs"
  add_foreign_key "song_vocalists", "vocalists"
  add_foreign_key "vocalists", "artists"
end
