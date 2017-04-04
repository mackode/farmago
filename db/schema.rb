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

ActiveRecord::Schema.define(version: 20141004134658) do

  create_table "leki_refundowane", id: false, force: true do |t|
    t.integer "ID",                                                               null: false
    t.text    "Substancja czynna",                                                null: false
    t.text    "Nazwa leku",                                                       null: false
    t.text    "Zawartość opakowania",                                             null: false
    t.integer "Kod EAN",                                                          null: false
    t.date    "Termin wejścia w życie",                                           null: false
    t.integer "Okres obowiązywania decyzji",                                      null: false
    t.text    "Grupa limitowa - opis",                                            null: false
    t.float   "Urzędowa cena zbytu",                                   limit: 53, null: false
    t.float   "Cena hurtowa brutto",                                   limit: 53, null: false
    t.float   "Cena detaliczna",                                       limit: 53, null: false
    t.float   "Wysokość limitu finansowania",                          limit: 53, null: false
    t.text    "Zakres wskazań objętych refundacją",                               null: false
    t.text    "Zakres wskazań pozarefundacyjnych objętych refundacją",            null: false
    t.integer "Poziom odpłatności",                                               null: false
    t.float   "Wysokość dopłaty świadczeniobiorcy",                    limit: 53, null: false
  end

  create_table "refunded_drugs", force: true do |t|
    t.string   "active_substance"
    t.string   "drug_name"
    t.string   "package_content"
    t.integer  "ean_code"
    t.date     "effective_date"
    t.integer  "in_force_for"
    t.text     "limited_group"
    t.float    "official_selling_price", limit: 24
    t.float    "gross_selling_price",    limit: 24
    t.float    "retail_price",           limit: 24
    t.float    "financing_limit",        limit: 24
    t.text     "indications_range"
    t.text     "other_indications"
    t.integer  "repayment_level"
    t.float    "payment_amount",         limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
