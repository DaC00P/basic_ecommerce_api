# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170503224937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "name",                 null: false
  end

  create_table "categories_products", force: :cascade do |t|
    t.integer  "product_id",  null: false
    t.integer  "category_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "customer_first_name",    null: false
    t.string   "customer_last_name",     null: false
    t.string   "customer_email_address", null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.text     "username",               null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id",         null: false
    t.integer  "product_id",       null: false
    t.integer  "product_quantity", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id",  null: false
    t.integer "number_items"
    t.text    "order_status"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                           null: false
    t.text     "description",                    null: false
    t.boolean  "out_of_stock",   default: false, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "price_in_cents"
  end

end
