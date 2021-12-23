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

ActiveRecord::Schema.define(version: 2021120113212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disbursements", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "fee_configuration_id", null: false
    t.datetime "processed_at"
    t.float "value"
    t.string "status"
    t.index ["fee_configuration_id"], name: "index_disbursements_on_fee_configuration_id"
    t.index ["order_id"], name: "index_disbursements_on_order_id"
  end

  create_table "fee_configurations", force: :cascade do |t|
    t.bigint "fee_configurations_type_id", null: false
    t.float "fee_percentage"
    t.integer "min_amount"
    t.integer "max_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fee_configurations_type_id"], name: "index_fee_configurations_on_fee_configurations_type_id"
  end

  create_table "fee_configurations_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cif"
    t.string "status"
    t.bigint "fee_configurations_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fee_configurations_type_id"], name: "index_merchants_on_fee_configurations_type_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "merchant_id", null: false
    t.bigint "shopper_id", null: false
    t.float "amount"
    t.string "status"
    t.datetime "complete_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id"], name: "index_orders_on_merchant_id"
    t.index ["shopper_id"], name: "index_orders_on_shopper_id"
  end

  create_table "shoppers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "nif"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "disbursements", "fee_configurations"
  add_foreign_key "disbursements", "orders"
  add_foreign_key "fee_configurations", "fee_configurations_types"
  add_foreign_key "merchants", "fee_configurations_types"
  add_foreign_key "orders", "merchants"
  add_foreign_key "orders", "shoppers"
end
