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

ActiveRecord::Schema.define(version: 20161225141524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sourceable_type"
    t.integer  "sourceable_id"
    t.string   "templatable_type"
    t.integer  "templatable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["sourceable_type", "sourceable_id"], name: "index_messages_on_sourceable_type_and_sourceable_id", using: :btree
    t.index ["templatable_type", "templatable_id"], name: "index_messages_on_templatable_type_and_templatable_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_audios", force: :cascade do |t|
    t.string   "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_images", force: :cascade do |t|
    t.string   "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_locations", force: :cascade do |t|
    t.string   "message_id"
    t.string   "title"
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_stickers", force: :cascade do |t|
    t.string   "message_id"
    t.string   "package_id"
    t.string   "sticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_texts", force: :cascade do |t|
    t.string   "message_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_videos", force: :cascade do |t|
    t.string   "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "name"
    t.string   "avatar"
    t.string   "status_message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
