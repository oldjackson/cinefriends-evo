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

ActiveRecord::Schema.define(version: 20180311202103) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favdirector_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "favdirector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favdirector_id"], name: "index_favdirector_users_on_favdirector_id"
    t.index ["user_id"], name: "index_favdirector_users_on_user_id"
  end

  create_table "favdirectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favmovie_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "favmovie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favmovie_id"], name: "index_favmovie_users_on_favmovie_id"
    t.index ["user_id"], name: "index_favmovie_users_on_user_id"
  end

  create_table "favmovies", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_users", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genre_users_on_genre_id"
    t.index ["user_id"], name: "index_genre_users_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "pairing_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pairing_id"], name: "index_messages_on_pairing_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.string "poster"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "frame"
  end

  create_table "pairings", force: :cascade do |t|
    t.bigint "posting_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["posting_id"], name: "index_pairings_on_posting_id"
    t.index ["user_id"], name: "index_pairings_on_user_id"
  end

  create_table "postings", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "show_id"
    t.boolean "active", default: true
    t.index ["show_id"], name: "index_postings_on_show_id"
    t.index ["user_id"], name: "index_postings_on_user_id"
  end

  create_table "shows", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.bigint "movie_id"
    t.bigint "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_shows_on_movie_id"
    t.index ["theater_id"], name: "index_shows_on_theater_id"
  end

  create_table "theaters", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "favorite_seating"
    t.string "photo"
    t.string "first_name"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name_fb"
    t.string "last_name_fb"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favdirector_users", "favdirectors"
  add_foreign_key "favdirector_users", "users"
  add_foreign_key "favmovie_users", "favmovies"
  add_foreign_key "favmovie_users", "users"
  add_foreign_key "genre_users", "genres"
  add_foreign_key "genre_users", "users"
  add_foreign_key "messages", "pairings"
  add_foreign_key "messages", "users"
  add_foreign_key "pairings", "postings"
  add_foreign_key "pairings", "users"
  add_foreign_key "postings", "shows"
  add_foreign_key "postings", "users"
  add_foreign_key "shows", "movies"
  add_foreign_key "shows", "theaters"
end
