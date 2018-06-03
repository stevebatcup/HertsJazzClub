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

ActiveRecord::Schema.define(version: 20180603071849) do

  create_table "double_bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gigs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "season_id"
    t.text     "description",     limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.date     "date"
    t.string   "act"
    t.string   "image"
    t.string   "website"
    t.string   "booking_url"
    t.string   "gallery_url"
    t.datetime "starts"
    t.datetime "ends"
    t.integer  "parent_id"
    t.integer  "pricing_tier_id",               default: 1
  end

  create_table "instruments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "shorthand"
  end

  create_table "instruments_musicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "instrument_id"
    t.integer "musician_id"
  end

  create_table "musicians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "performances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "gig_id"
    t.integer "musician_id"
    t.integer "instrument_id"
  end

  create_table "pricing_tiers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name"
    t.decimal "standard",             precision: 8, scale: 2
    t.decimal "standard_advanced",    precision: 8, scale: 2
    t.decimal "concessions",          precision: 8, scale: 2
    t.decimal "concessions_advanced", precision: 8, scale: 2
    t.decimal "members",              precision: 8, scale: 2
    t.decimal "members_advanced",     precision: 8, scale: 2
  end

  create_table "seasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "year"
    t.string   "name"
    t.integer  "venue_id"
    t.boolean  "is_current", default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "address",    limit: 65535
    t.string   "phone"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
