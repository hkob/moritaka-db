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

ActiveRecord::Schema.define(version: 20140306205844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instrumentals", force: true do |t|
    t.integer  "sort_order", null: false
    t.integer  "title_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instrumentals", ["sort_order"], name: "index_instrumentals_on_sort_order", using: :btree

  create_table "people", force: true do |t|
    t.integer  "title_id",   null: false
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.integer  "title_id",   null: false
    t.integer  "parent_id"
    t.integer  "year_id",    null: false
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["year_id", "date"], name: "index_songs_on_year_id_and_date", using: :btree

  create_table "titles", force: true do |t|
    t.string   "japanese",   null: false
    t.string   "english",    null: false
    t.string   "yomi",       null: false
    t.string   "yomi_suuji", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "titles", ["japanese"], name: "index_titles_on_japanese", unique: true, using: :btree
  add_index "titles", ["yomi_suuji"], name: "index_titles_on_yomi_suuji", using: :btree

  create_table "years", force: true do |t|
    t.integer  "year",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "years", ["year"], name: "index_years_on_year", using: :btree

end
