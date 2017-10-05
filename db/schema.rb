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

ActiveRecord::Schema.define(version: 20171004213324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.integer "addressable_id"
    t.string "addressable_type"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", null: false
    t.string "job_title", null: false
    t.string "business_phone", null: false
    t.integer "contactable_id"
    t.string "contactable_type"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "webpage"
    t.string "notes"
  end

  create_table "employees", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", null: false
    t.string "job_title", null: false
    t.string "business_phone", null: false
    t.string "webpage"
    t.string "notes"
  end

  create_table "order_details", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1, null: false
    t.decimal "unit_price"
    t.decimal "discount"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "customer_id"
    t.date "order_date"
    t.date "shipped_date"
    t.bigint "shipper_id"
    t.string "name"
    t.decimal "shipping_fee"
    t.decimal "taxes"
    t.string "payment_type"
    t.date "paid_date"
    t.string "notes"
    t.decimal "tax_rate"
    t.string "status"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["shipper_id"], name: "index_orders_on_shipper_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "supplier_id"
    t.string "product_code", null: false
    t.string "product_name", null: false
    t.decimal "standard_cost"
    t.decimal "list_price"
    t.integer "reorder_level", default: 0, null: false
    t.integer "target_level", default: 0, null: false
    t.boolean "discontinued", default: false, null: false
    t.integer "minimum_reorder_quantity", default: 0, null: false
    t.string "category", null: false
    t.index ["supplier_id"], name: "index_products_on_supplier_id"
  end

  create_table "shippers", force: :cascade do |t|
    t.string "name", null: false
    t.string "webpage"
    t.string "notes"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", null: false
    t.string "webpage"
    t.string "notes"
  end

end
