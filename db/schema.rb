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

ActiveRecord::Schema[7.0].define(version: 2023_03_19_124433) do
  create_table "concepts", force: :cascade do |t|
    t.integer "subject_matter_id", null: false
    t.string "name"
    t.string "concept_prompt"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_matter_id"], name: "index_concepts_on_subject_matter_id"
  end

  create_table "student_chat_fragments", force: :cascade do |t|
    t.string "response_type"
    t.text "chat_text"
    t.string "student_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_chats", force: :cascade do |t|
    t.integer "concept_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concept_id"], name: "index_student_chats_on_concept_id"
  end

  create_table "subject_matters", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "concepts", "subject_matters"
  add_foreign_key "student_chats", "concepts"
end
