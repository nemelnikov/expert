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

ActiveRecord::Schema.define(version: 20150627025011) do

  create_table "ask_experts", force: :cascade do |t|
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
  end

  add_index "ask_experts", ["email"], name: "index_ask_experts_on_email", unique: true, using: :btree
  add_index "ask_experts", ["reset_password_token"], name: "index_ask_experts_on_reset_password_token", unique: true, using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "genres_profile_experts", id: false, force: :cascade do |t|
    t.integer "genre_id",          limit: 4
    t.integer "profile_expert_id", limit: 4
  end

  add_index "genres_profile_experts", ["genre_id"], name: "index_genres_profile_experts_on_genre_id", using: :btree
  add_index "genres_profile_experts", ["profile_expert_id"], name: "index_genres_profile_experts_on_profile_expert_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "question_id",  limit: 4
    t.text     "message_body", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "messages", ["question_id"], name: "index_messages_on_question_id", using: :btree

  create_table "profile_experts", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.string   "skype",          limit: 255
    t.text     "about",          limit: 65535
    t.integer  "free_questions", limit: 4,     default: 10
    t.integer  "ask_expert_id",  limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "profile_experts", ["ask_expert_id"], name: "index_profile_experts_on_ask_expert_id", using: :btree

  create_table "profile_users", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "skype",      limit: 255
    t.boolean  "admin",      limit: 1,   default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "profile_users", ["user_id"], name: "index_profile_users_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.text     "question_description", limit: 65535
    t.integer  "profile_user_id",      limit: 4
    t.integer  "profile_expert_id",    limit: 4
    t.string   "question_type",        limit: 255
    t.integer  "genre_id",             limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "questions", ["genre_id"], name: "index_questions_on_genre_id", using: :btree
  add_index "questions", ["profile_expert_id"], name: "index_questions_on_profile_expert_id", using: :btree
  add_index "questions", ["profile_user_id"], name: "index_questions_on_profile_user_id", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "messages", "questions"
  add_foreign_key "profile_experts", "ask_experts"
  add_foreign_key "profile_users", "users"
  add_foreign_key "questions", "genres"
  add_foreign_key "questions", "profile_experts"
  add_foreign_key "questions", "profile_users"
end
