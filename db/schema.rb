# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_01_205624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "home_news", force: :cascade do |t|
    t.string "author"
    t.string "content"
    t.string "description"
    t.string "published_at"
    t.string "title"
    t.string "url"
    t.string "url_to_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "logo_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "full_name"
    t.string "real_team_id"
    t.string "jersey_number"
    t.string "position"
    t.string "height"
    t.string "weight"
    t.string "birthdate"
    t.string "college"
    t.string "player_image", default: "https://alumni.crg.eu/sites/default/files/default_images/default-picture_0_0.png"
    t.string "team_draft_id"
    t.string "league"
    t.string "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "market"
    t.string "alias"
    t.string "venue"
    t.string "url_reference"
    t.string "image"
    t.string "sport_title"
    t.string "team_reference"
    t.integer "league_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_bookmarks", force: :cascade do |t|
    t.string "author"
    t.string "content"
    t.string "description"
    t.string "published_at"
    t.string "title"
    t.string "url"
    t.string "urlToImage"
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "image"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
