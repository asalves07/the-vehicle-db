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

ActiveRecord::Schema.define(version: 2020_10_19_012237) do

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales", force: :cascade do |t|
    t.boolean "sold"
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_id"], name: "index_sales_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "car_model"
    t.string "color"
    t.string "transmission"
    t.string "drive_type"
    t.string "fuel_type"
    t.string "car_type"
    t.integer "door"
    t.integer "engine"
    t.integer "year"
    t.integer "kilometrage"
    t.string "plate"
    t.integer "manufacturer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manufacturer_id"], name: "index_vehicles_on_manufacturer_id"
  end

  add_foreign_key "sales", "vehicles"
  add_foreign_key "vehicles", "manufacturers"
end
