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

ActiveRecord::Schema.define(version: 20140413201724) do

  create_table "authors", force: true do |t|
    t.integer  "born"
    t.integer  "died"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "book_authors", force: true do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "book_genres", force: true do |t|
    t.integer  "book_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "name"
    t.text     "plot"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publisher_id"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publishers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "text"
    t.integer  "score"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
