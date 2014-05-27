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

ActiveRecord::Schema.define(version: 20140524172644) do

  create_table "cats", force: true do |t|
    t.string   "catador"
    t.integer  "brillo"
    t.integer  "rojo"
    t.integer  "olfato"
    t.integer  "retro_olfato"
    t.integer  "peridental"
    t.integer  "palatina"
    t.integer  "lingual"
    t.integer  "retrogusto"
    t.integer  "complemento_blanco"
    t.integer  "complemento_tinto"
    t.integer  "total"
    t.integer  "vino_id"
    t.string   "amarillo"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_catas"
    t.integer  "cat_may"
    t.integer  "cat_min"
    t.integer  "cat_med"
    t.text     "comentario"
  end

  add_index "cats", ["vino_id", "created_at"], name: "index_cats_on_vino_id_and_created_at"

  create_table "sessions", force: true do |t|
    t.string   "session_id"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vinos", force: true do |t|
    t.string   "vino"
    t.string   "zona"
    t.string   "tipo"
    t.integer  "anno"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_catas"
    t.integer  "cat_may"
    t.integer  "cat_min"
    t.integer  "cat_med"
    t.decimal  "grados"
    t.decimal  "precio"
  end

end
