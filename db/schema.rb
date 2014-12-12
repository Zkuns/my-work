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

ActiveRecord::Schema.define(version: 20141212164749) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.datetime "time"
    t.string   "internumber"
    t.integer  "usernumber",   default: 0
    t.integer  "yidong",       default: 0
    t.integer  "liantong",     default: 0
    t.integer  "dianxing",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "signupnumber", default: 0
    t.integer  "company_id"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.boolean  "admin",          default: false
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "name"
    t.boolean  "coo_type"
    t.integer  "company_id"
    t.string   "company_name"
  end

end
