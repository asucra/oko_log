# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_23_093146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anger_log_emotions", force: :cascade do |t|
    t.bigint "anger_log_id", null: false
    t.bigint "emotion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anger_log_id", "emotion_id"], name: "index_anger_log_emotions_on_anger_log_id_and_emotion_id", unique: true
    t.index ["anger_log_id"], name: "index_anger_log_emotions_on_anger_log_id"
    t.index ["emotion_id"], name: "index_anger_log_emotions_on_emotion_id"
  end

  create_table "anger_log_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "anger_log_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anger_log_id"], name: "index_anger_log_tags_on_anger_log_id"
    t.index ["tag_id", "anger_log_id"], name: "index_anger_log_tags_on_tag_id_and_anger_log_id", unique: true
    t.index ["tag_id"], name: "index_anger_log_tags_on_tag_id"
  end

  create_table "anger_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "occurrence_at", null: false
    t.string "place", null: false
    t.text "event", null: false
    t.text "thought", null: false
    t.integer "anger_level", null: false
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_anger_logs_on_user_id"
  end

  create_table "emotions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.string "unconfirmed_email"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "anger_log_emotions", "anger_logs"
  add_foreign_key "anger_log_emotions", "emotions"
  add_foreign_key "anger_log_tags", "anger_logs"
  add_foreign_key "anger_log_tags", "tags"
  add_foreign_key "anger_logs", "users"
end
