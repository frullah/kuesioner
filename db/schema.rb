# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_03_113456) do

  create_table "admins", force: :cascade do |t|
    t.string "nama", limit: 64
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dosens", force: :cascade do |t|
    t.string "nidn", limit: 14, null: false
    t.string "nama", limit: 48, null: false
    t.string "pendidikan", limit: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nidn"], name: "index_dosens_on_nidn", unique: true
  end

  create_table "item_kuesioners", force: :cascade do |t|
    t.integer "kategori_kuesioner_id", null: false
    t.string "pertanyaan", limit: 80
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kategori_kuesioner_id"], name: "index_item_kuesioners_on_kategori_kuesioner_id"
  end

  create_table "kategori_kuesioners", force: :cascade do |t|
    t.string "nama", limit: 32
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nama"], name: "index_kategori_kuesioners_on_nama", unique: true
  end

  create_table "mahasiswas", force: :cascade do |t|
    t.string "nama", limit: 48, null: false
    t.string "npm", limit: 14, null: false
    t.integer "prodi_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["npm"], name: "index_mahasiswas_on_npm", unique: true
    t.index ["prodi_id"], name: "index_mahasiswas_on_prodi_id"
  end

  create_table "mata_kuliahs", force: :cascade do |t|
    t.string "nama", limit: 48
    t.integer "prodi_id", null: false
    t.integer "sks", limit: 1
    t.integer "semester", limit: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prodi_id"], name: "index_mata_kuliahs_on_prodi_id"
  end

  create_table "prodis", force: :cascade do |t|
    t.string "nama", limit: 32, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["nama"], name: "index_prodis_on_nama", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "username", limit: 64, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authenticatable_type"
    t.integer "authenticatable_id"
    t.index ["authenticatable_type", "authenticatable_id"], name: "index_users_on_authenticatable_type_and_authenticatable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "item_kuesioners", "kategori_kuesioners"
  add_foreign_key "mahasiswas", "prodis"
  add_foreign_key "mata_kuliahs", "prodis"
end
