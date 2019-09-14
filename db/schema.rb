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

ActiveRecord::Schema.define(version: 2019_09_14_150700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.jsonb "sold_price"
    t.jsonb "schools"
    t.jsonb "crime"
    t.jsonb "demographics"
    t.jsonb "price"
    t.jsonb "growth"
    t.jsonb "demand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "average_deposit"
    t.float "latitude"
    t.float "longitude"
    t.string "area_postcode"
  end

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.string "postcode"
    t.integer "bedroom"
    t.text "description"
    t.integer "bathroom"
    t.integer "square_feet"
    t.jsonb "council_tax"
    t.jsonb "ptal"
    t.boolean "green_belt"
    t.jsonb "restaurants"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.float "latitude"
    t.float "longitude"
    t.index ["area_id"], name: "index_houses_on_area_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "amount"
    t.string "year"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_prices_on_area_id"
  end

  create_table "searches", force: :cascade do |t|
    t.integer "borrowing"
    t.integer "gross_annual"
    t.integer "deposit"
    t.integer "credit_score"
    t.boolean "school"
    t.integer "distance_to_work"
    t.bigint "area_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "work_postcode"
    t.index ["area_id"], name: "index_searches_on_area_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "income"
    t.integer "credit_score"
    t.datetime "date_of_birth"
    t.integer "deposit"
    t.integer "borrowing"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "houses", "areas"
  add_foreign_key "prices", "areas"
  add_foreign_key "searches", "areas"
  add_foreign_key "searches", "users"
end
