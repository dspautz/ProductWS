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

ActiveRecord::Schema.define(version: 20141107001640) do

  create_table "item_lines", force: true do |t|
    t.integer  "quantity"
    t.decimal  "net_price"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "order_date", default: '2014-11-11'
    t.integer  "vat",        default: 20
    t.string   "status",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["status"], name: "index_orders_on_status"

  create_table "products", force: true do |t|
    t.string   "name",                                null: false
    t.decimal  "net_price",  precision: 10, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_transitions", force: true do |t|
    t.string   "event",      null: false
    t.string   "from",       null: false
    t.string   "to",         null: false
    t.integer  "order_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
