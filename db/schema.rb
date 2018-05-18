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

ActiveRecord::Schema.define(version: 20180518131653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.integer "sender_id"
    t.string "recipient_email"
    t.string "token"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learningstyles", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "question1"
    t.string "question2"
    t.string "question3"
    t.string "question4"
    t.string "question5"
    t.string "question6"
    t.string "question7"
    t.string "question8"
    t.string "question9"
    t.string "question10"
    t.string "question11"
    t.string "question12"
    t.string "question13"
    t.string "question14"
    t.string "question15"
    t.string "question16"
    t.string "question17"
    t.string "question18"
    t.string "question19"
    t.string "question20"
    t.string "question21"
    t.string "question22"
    t.string "question23"
    t.string "question24"
    t.string "question25"
    t.string "question26"
    t.string "question27"
    t.string "question28"
    t.string "question29"
    t.string "question30"
    t.string "question31"
    t.string "question32"
    t.string "question33"
    t.string "question34"
    t.string "question35"
    t.string "question36"
    t.string "question37"
    t.string "question38"
    t.string "question39"
    t.string "question40"
    t.string "question41"
    t.string "question42"
    t.string "question43"
    t.string "question44"
    t.string "question45"
    t.string "question46"
    t.string "question47"
    t.string "question48"
    t.string "question49"
    t.string "question50"
    t.string "question51"
    t.string "question52"
    t.string "question53"
    t.string "question54"
    t.string "question55"
    t.string "question56"
    t.string "question57"
    t.string "question58"
    t.string "question59"
    t.string "question60"
    t.string "question61"
    t.string "question62"
    t.string "question63"
    t.string "question64"
    t.string "question65"
    t.string "question66"
    t.string "question67"
    t.string "question68"
    t.string "question69"
    t.string "question70"
    t.string "question71"
    t.string "question72"
    t.string "question73"
    t.string "question74"
    t.string "question75"
    t.string "question76"
    t.string "question77"
    t.string "question78"
    t.string "question79"
    t.string "question80"
    t.integer "activisttotal"
    t.integer "reflectortotal"
    t.integer "theoristtotal"
    t.integer "pragmatisttotal"
    t.string "actstatus"
    t.string "refstatus"
    t.string "theostatus"
    t.string "pragstatus"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_learningstyles_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "org_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "teaminvites", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "email"
    t.boolean "accepted"
    t.boolean "admin"
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_teaminvites_on_team_id"
    t.index ["user_id"], name: "index_teaminvites_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_teams_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remeber_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "invitation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "step_no"
  end

  add_foreign_key "learningstyles", "users"
  add_foreign_key "organizations", "users"
  add_foreign_key "teaminvites", "teams"
  add_foreign_key "teaminvites", "users"
  add_foreign_key "teams", "organizations"
end
