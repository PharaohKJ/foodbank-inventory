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

ActiveRecord::Schema[7.0].define(version: 2023_11_23_015452) do
  create_table "donation_request_contents", force: :cascade do |t|
    t.integer "donation_request_id", null: false
    t.string "maker"
    t.date "expiry_date"
    t.integer "per_weight"
    t.integer "per_case"
    t.integer "count"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "content_type"
    t.index ["donation_request_id"], name: "index_donation_request_contents_on_donation_request_id"
  end

  create_table "donation_requests", force: :cascade do |t|
    t.string "email"
    t.string "company"
    t.string "name"
    t.string "address"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "receive_donation_requests", force: :cascade do |t|
    t.string "tel"
    t.string "name"
    t.datetime "scheduled_time"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fax"
    t.string "organization_name"
    t.string "reason"
    t.datetime "used_at"
    t.datetime "scheduled_at"
    t.datetime "accepted_at"
  end

  create_table "store_room_entries", force: :cascade do |t|
    t.integer "donation_request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_request_id"], name: "index_store_room_entries_on_donation_request_id"
  end

  create_table "store_room_entry_contents", force: :cascade do |t|
    t.integer "store_room_entry_id", null: false
    t.string "barcode"
    t.string "maker"
    t.string "name"
    t.integer "content_type"
    t.integer "donation_request_content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.index ["donation_request_content_id"], name: "index_store_room_entry_contents_on_donation_request_content_id"
    t.index ["store_room_entry_id"], name: "index_store_room_entry_contents_on_store_room_entry_id"
  end

  create_table "store_room_exit_contents", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "store_room_exit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "content_type"
    t.integer "weight"
    t.boolean "is_drive", default: false
    t.index ["store_room_exit_id"], name: "index_store_room_exit_contents_on_store_room_exit_id"
  end

  create_table "store_room_exits", force: :cascade do |t|
    t.boolean "draft", default: true
    t.integer "from_receive_donation_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "donation_request_contents", "donation_requests"
  add_foreign_key "store_room_entries", "donation_requests"
  add_foreign_key "store_room_entry_contents", "donation_request_contents"
  add_foreign_key "store_room_entry_contents", "store_room_entries"
  add_foreign_key "store_room_exit_contents", "store_room_exits"
end
