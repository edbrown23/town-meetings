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

ActiveRecord::Schema[7.1].define(version: 2023_12_14_164923) do
  create_table "meeting_summaries", force: :cascade do |t|
    t.integer "meeting_id"
    t.string "full_text"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_meeting_summaries_on_meeting_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "title"
    t.text "status"
    t.text "recording_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "local_meeting_url"
  end

  create_table "transcribed_sections", force: :cascade do |t|
    t.integer "meeting_id"
    t.integer "order"
    t.integer "seek"
    t.integer "start"
    t.integer "end"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_transcribed_sections_on_meeting_id"
  end

end
