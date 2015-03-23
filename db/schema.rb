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

ActiveRecord::Schema.define(version: 20150323172605) do

  create_table "bids", force: :cascade do |t|
    t.integer  "uasg_id"
    t.string   "numero"
    t.string   "objeto_do_pregao"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "bids", ["uasg_id"], name: "index_bids_on_uasg_id"

  create_table "item_classifications", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "item"
    t.integer  "item_classification_id"
    t.text     "descricao"
    t.integer  "supplier_id"
    t.date     "validade"
    t.string   "unidade"
    t.integer  "quantidade"
    t.integer  "valor_unitario_cents"
    t.string   "tipo"
    t.text     "observacao"
    t.boolean  "ativo"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "bid_id"
  end

  add_index "items", ["bid_id"], name: "index_items_on_bid_id"
  add_index "items", ["item_classification_id"], name: "index_items_on_item_classification_id"
  add_index "items", ["supplier_id"], name: "index_items_on_supplier_id"

  create_table "requests", force: :cascade do |t|
    t.integer  "qtd_solicitada"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "supplier_groups", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "supplier_groups_suppliers", force: :cascade do |t|
    t.integer "supplier_group_id"
    t.integer "supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "razao_social"
    t.string   "email"
    t.string   "telefone"
    t.string   "celular"
    t.string   "contato"
    t.text     "observacoes"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "uasgs", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_authorization"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
