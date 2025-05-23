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

ActiveRecord::Schema[8.0].define(version: 2025_05_04_110302) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "expense_categories", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_expense_categories_on_category_id"
    t.index ["expense_id", "category_id"], name: "index_expense_categories_on_expense_id_and_category_id", unique: true
    t.index ["expense_id"], name: "index_expense_categories_on_expense_id"
  end

  create_table "expense_payment_methods", force: :cascade do |t|
    t.bigint "expense_id", null: false
    t.bigint "payment_method_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id", "payment_method_id"], name: "idx_on_expense_id_payment_method_id_ff738d4e9b", unique: true
    t.index ["expense_id"], name: "index_expense_payment_methods_on_expense_id"
    t.index ["payment_method_id"], name: "index_expense_payment_methods_on_payment_method_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.text "description", null: false
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_payment_methods_on_name", unique: true
  end

  add_foreign_key "expense_categories", "categories"
  add_foreign_key "expense_categories", "expenses"
  add_foreign_key "expense_payment_methods", "expenses"
  add_foreign_key "expense_payment_methods", "payment_methods"
end
