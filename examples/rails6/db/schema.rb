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

ActiveRecord::Schema[7.0].define(version: 2022_03_01_000005) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "variations_enum", ["one", "two", "three", "four"]

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "author_name"
    t.integer "view_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "author_name"], name: "index_books_on_name_and_author_name", unique: true
  end

  create_table "campaign_books", force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "price"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "price"], name: "index_campaign_books_on_book_id_and_price", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", null: false
    t.integer "author_id"
    t.json "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title", "author_id"], name: "index_posts_on_title_and_author_id", unique: true
  end

  create_table "purchased_books", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.string "receipt_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_user", force: :cascade do |t|
    t.string "tag_label", null: false
    t.integer "user_id"
    t.integer "tag_likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_label", "user_id"], name: "index_tag_user_on_tag_label_and_user_id", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label"], name: "index_tags_on_label", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.json "preferences"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "variations", force: :cascade do |t|
    t.integer "c_integer"
    t.bigint "c_bigint"
    t.text "c_text"
    t.string "c_string"
    t.float "c_float"
    t.decimal "c_decimal"
    t.decimal "c_decimal_params", precision: 10, scale: 2
    t.boolean "c_boolean"
    t.date "c_date"
    t.datetime "c_datetime"
    t.time "c_time"
    t.datetime "c_timestamp", precision: nil
    t.binary "c_binary"
    t.enum "c_enu", enum_type: "variations_enum"
    t.json "c_json_array"
    t.json "c_json_object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "books", "users", column: "author_name", primary_key: "name"
  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "purchased_books", "books"
  add_foreign_key "purchased_books", "users"
  add_foreign_key "tag_user", "tags", column: "tag_label", primary_key: "label"
  add_foreign_key "tag_user", "users"
end
