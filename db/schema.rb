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

ActiveRecord::Schema.define(version: 20160825134251) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "material"
    t.integer  "maxSubscriptions"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.string   "lastName"
    t.string   "firstName"
    t.string   "telefonNumber"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "alias"
    t.string   "street"
    t.string   "city"
    t.integer  "postalCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "name"
    t.decimal  "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sport_modules", force: :cascade do |t|
    t.string   "code"
    t.integer  "place_id"
    t.string   "activity"
    t.integer  "coach_id"
    t.integer  "day"
    t.time     "startTime"
    t.time     "endTime"
    t.integer  "maxSubscriptions"
    t.string   "meetingPlace"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "sport_modules", ["activity"], name: "index_sport_modules_on_activity"
  add_index "sport_modules", ["coach_id"], name: "index_sport_modules_on_coach_id"
  add_index "sport_modules", ["place_id"], name: "index_sport_modules_on_place_id"

  create_table "sports_days", force: :cascade do |t|
    t.string   "code"
    t.integer  "place_id"
    t.date     "date"
    t.decimal  "price"
    t.time     "startTime"
    t.time     "endTime"
    t.string   "morningPlace"
    t.string   "afternoonPlace"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "paymentDate"
  end

  add_index "sports_days", ["place_id"], name: "index_sports_days_on_place_id"

  create_table "sports_training_activities", force: :cascade do |t|
    t.integer  "sports_training_id"
    t.integer  "activity_id"
    t.string   "period"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "sports_training_activities", ["activity_id"], name: "index_sports_training_activities_on_activity_id"
  add_index "sports_training_activities", ["sports_training_id"], name: "index_sports_training_activities_on_sports_training_id"

  create_table "sports_trainings", force: :cascade do |t|
    t.string   "code"
    t.integer  "place_id"
    t.date     "startDate"
    t.date     "endDate"
    t.time     "startTime"
    t.time     "endTime"
    t.decimal  "halfDayPrice"
    t.decimal  "fullDayPrice"
    t.string   "morningNursery"
    t.string   "afternoonNursery"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "sports_trainings", ["place_id"], name: "index_sports_trainings_on_place_id"

  create_table "subscriptions", force: :cascade do |t|
    t.string   "type"
    t.string   "lastName"
    t.string   "firstName"
    t.date     "birthDate"
    t.string   "street"
    t.string   "city"
    t.integer  "postalCode"
    t.string   "telefonNumber"
    t.string   "email"
    t.text     "comment"
    t.boolean  "paid",                  default: false
    t.integer  "sport_module_id"
    t.integer  "sports_training_id"
    t.integer  "swim_lesson_id"
    t.integer  "sports_day_id"
    t.integer  "place_id"
    t.integer  "level_id"
    t.integer  "activity_morning_id"
    t.integer  "activity_afternoon_id"
    t.date     "dueDate"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "subscriptions", ["activity_afternoon_id"], name: "index_subscriptions_on_activity_afternoon_id"
  add_index "subscriptions", ["activity_morning_id"], name: "index_subscriptions_on_activity_morning_id"
  add_index "subscriptions", ["level_id"], name: "index_subscriptions_on_level_id"
  add_index "subscriptions", ["place_id"], name: "index_subscriptions_on_place_id"
  add_index "subscriptions", ["sport_module_id"], name: "index_subscriptions_on_sport_module_id"
  add_index "subscriptions", ["sports_day_id"], name: "index_subscriptions_on_sports_day_id"
  add_index "subscriptions", ["sports_training_id"], name: "index_subscriptions_on_sports_training_id"
  add_index "subscriptions", ["swim_lesson_id"], name: "index_subscriptions_on_swim_lesson_id"

  create_table "swim_lessons", force: :cascade do |t|
    t.string   "code"
    t.integer  "place_id"
    t.integer  "level_id"
    t.integer  "coach_id"
    t.integer  "day"
    t.time     "startTime"
    t.time     "endTime"
    t.integer  "maxSubscriptions"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "category"
  end

  add_index "swim_lessons", ["coach_id"], name: "index_swim_lessons_on_coach_id"
  add_index "swim_lessons", ["level_id"], name: "index_swim_lessons_on_level_id"
  add_index "swim_lessons", ["place_id"], name: "index_swim_lessons_on_place_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
