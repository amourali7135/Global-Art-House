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

ActiveRecord::Schema.define(version: 2019_09_22_092514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arts", force: :cascade do |t|
    t.string "title"
    t.string "photo"
    t.text "description"
    t.date "completion_date"
    t.text "inspiration"
    t.boolean "available"
    t.integer "price_cents"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_arts_on_member_id"
  end

  create_table "cart_products", force: :cascade do |t|
    t.bigint "shopping_cart_id"
    t.bigint "art_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_cart_products_on_art_id"
    t.index ["shopping_cart_id"], name: "index_cart_products_on_shopping_cart_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "art_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_comments_on_art_id"
    t.index ["member_id"], name: "index_comments_on_member_id"
  end

  create_table "descriptive_tags", force: :cascade do |t|
    t.string "tag"
    t.bigint "art_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_descriptive_tags_on_art_id"
    t.index ["member_id"], name: "index_descriptive_tags_on_member_id"
  end

  create_table "flags", force: :cascade do |t|
    t.string "photo"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_flags_on_location_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "count"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_follows_on_member_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "art_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_likes_on_art_id"
    t.index ["member_id"], name: "index_likes_on_member_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_locations_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "artist"
    t.string "artist_name"
    t.string "photo"
    t.string "email"
    t.text "bio"
    t.integer "age"
    t.string "birth_country"
    t.text "languages_spoken"
    t.string "instagram"
    t.string "facebook"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.date "date_sent"
    t.string "sent_by"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_messages_on_member_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_city"
    t.integer "address_zipcode"
    t.string "state"
    t.string "country"
    t.integer "phone_number"
    t.jsonb "payment"
    t.integer "amount_cents"
    t.bigint "member_id"
    t.bigint "shopping_cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_orders_on_member_id"
    t.index ["shopping_cart_id"], name: "index_orders_on_shopping_cart_id"
  end

  create_table "reaction_lists", force: :cascade do |t|
    t.string "reaction_types"
    t.bigint "reaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reaction_id"], name: "index_reaction_lists_on_reaction_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "count"
    t.bigint "member_id"
    t.bigint "art_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["art_id"], name: "index_reactions_on_art_id"
    t.index ["member_id"], name: "index_reactions_on_member_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "total_price_cents"
    t.integer "count"
    t.string "status"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_shopping_carts_on_member_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "arts", "members"
  add_foreign_key "cart_products", "arts"
  add_foreign_key "cart_products", "shopping_carts"
  add_foreign_key "comments", "arts"
  add_foreign_key "comments", "members"
  add_foreign_key "descriptive_tags", "arts"
  add_foreign_key "descriptive_tags", "members"
  add_foreign_key "flags", "locations"
  add_foreign_key "follows", "members"
  add_foreign_key "likes", "arts"
  add_foreign_key "likes", "members"
  add_foreign_key "locations", "members"
  add_foreign_key "messages", "members"
  add_foreign_key "orders", "members"
  add_foreign_key "orders", "shopping_carts"
  add_foreign_key "reaction_lists", "reactions"
  add_foreign_key "reactions", "arts"
  add_foreign_key "reactions", "members"
  add_foreign_key "shopping_carts", "members"
end
