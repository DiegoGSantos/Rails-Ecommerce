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

ActiveRecord::Schema.define(version: 20150322021946) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address",     limit: 255
    t.string   "postal_code", limit: 255
    t.string   "city",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "customers", force: :cascade do |t|
    t.integer  "province_id", limit: 4
    t.integer  "address_id",  limit: 4
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "email",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.integer  "quantity",   limit: 4
    t.integer  "price",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.string   "status",      limit: 255
    t.integer  "pst_rate",    limit: 4
    t.integer  "gst_rate",    limit: 4
    t.integer  "hst_rate",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer  "customer_id",        limit: 4
    t.string   "card_holder_name",   limit: 255
    t.string   "card_number_string", limit: 255
    t.string   "card_valid_date",    limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id",        limit: 4
    t.string   "name",               limit: 255
    t.string   "description",        limit: 255
    t.text     "description_long",   limit: 65535
    t.integer  "price",              limit: 4
    t.integer  "stock_quantity",     limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "province_name", limit: 255
    t.string   "short_name",    limit: 255
    t.integer  "pst_rate",      limit: 4
    t.integer  "gst_rate",      limit: 4
    t.integer  "hst_rate",      limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
