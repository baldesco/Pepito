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

ActiveRecord::Schema.define(version: 20150304003213) do

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "provider"
    t.integer  "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "url_photo"
    t.string   "avatar"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "lineitems", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "sell_id"
    t.integer  "value"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "ref"
    t.integer  "price"
    t.integer  "quantity",    default: 0
    t.string   "brand"
    t.text     "description"
    t.string   "size"
    t.string   "color"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "promos", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "product_id"
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "discount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sells", force: :cascade do |t|
    t.integer  "total"
    t.text     "command"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "client_id"
  end

end
