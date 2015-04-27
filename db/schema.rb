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

ActiveRecord::Schema.define(version: 20150427111740) do

  create_table "accounting_actions", force: :cascade do |t|
    t.string   "codigo",      limit: 255
    t.string   "descricao",   limit: 255
    t.integer  "exercise_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "accounting_actions", ["exercise_id"], name: "index_accounting_actions_on_exercise_id", using: :btree

  create_table "action_plans", force: :cascade do |t|
    t.integer  "exercise_id", limit: 4
    t.string   "nome",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "setor",       limit: 255
  end

  add_index "action_plans", ["exercise_id"], name: "index_action_plans_on_exercise_id", using: :btree

  create_table "bids", force: :cascade do |t|
    t.integer  "uasg_id",          limit: 4
    t.string   "numero",           limit: 255
    t.string   "objeto_do_pregao", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "bids", ["uasg_id"], name: "index_bids_on_uasg_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "item_classifications", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "item",                   limit: 4
    t.integer  "item_classification_id", limit: 4
    t.text     "descricao",              limit: 65535
    t.integer  "supplier_id",            limit: 4
    t.date     "validade"
    t.string   "unidade",                limit: 255
    t.integer  "quantidade",             limit: 4
    t.integer  "valor_unitario_cents",   limit: 4
    t.string   "tipo",                   limit: 255
    t.text     "observacao",             limit: 65535
    t.boolean  "ativo",                  limit: 1
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "bid_id",                 limit: 4
    t.integer  "qtd_disponivel",         limit: 4
  end

  add_index "items", ["bid_id"], name: "index_items_on_bid_id", using: :btree
  add_index "items", ["item_classification_id"], name: "index_items_on_item_classification_id", using: :btree
  add_index "items", ["supplier_id"], name: "index_items_on_supplier_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "qtd_solicitada",           limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "numero_do_empenho",        limit: 255
    t.string   "classificacao_do_empenho", limit: 255
    t.string   "fonte_do_empenho",         limit: 255
    t.date     "data_empenho"
    t.integer  "accounting_action_id",     limit: 4
    t.integer  "order_id",                 limit: 4
    t.integer  "item_id",                  limit: 4
    t.integer  "status",                   limit: 4
    t.text     "justificativa",            limit: 65535
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "supplier_groups", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "supplier_groups_suppliers", force: :cascade do |t|
    t.integer "supplier_group_id", limit: 4
    t.integer "supplier_id",       limit: 4
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "cnpj",         limit: 255
    t.string   "razao_social", limit: 255
    t.string   "email",        limit: 255
    t.string   "telefone",     limit: 255
    t.string   "celular",      limit: 255
    t.string   "contato",      limit: 255
    t.text     "observacoes",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "uasgs", force: :cascade do |t|
    t.string   "codigo",     limit: 255
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin_authorization",    limit: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "accounting_actions", "exercises"
  add_foreign_key "action_plans", "exercises"
end
