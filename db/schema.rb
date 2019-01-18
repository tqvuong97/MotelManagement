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

ActiveRecord::Schema.define(version: 2019_01_18_091806) do

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.datetime "expired_at"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_areas_on_admin_id"
  end

  create_table "backup_guests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.text "address"
    t.string "identitycard"
    t.string "phonenumber"
    t.string "image"
    t.string "job"
    t.text "notice"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.datetime "deleted_at"
    t.index ["room_id"], name: "index_backup_guests_on_room_id"
  end

  create_table "billings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "electric"
    t.integer "water"
    t.integer "internet"
    t.integer "cleaner"
    t.integer "parking"
    t.integer "laundry"
    t.integer "option1"
    t.integer "option2"
    t.integer "option3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "services_room_id"
    t.integer "total"
    t.integer "rentingfee"
    t.integer "bominus"
    t.text "note"
    t.boolean "payment"
    t.index ["services_room_id"], name: "index_billings_on_services_room_id"
  end

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "branch"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.integer "quantity"
    t.date "datebegin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "device_id"
    t.bigint "room_id"
    t.index ["device_id"], name: "index_devices_rooms_on_device_id"
    t.index ["room_id"], name: "index_devices_rooms_on_room_id"
  end

  create_table "guests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.text "address"
    t.string "identitycard"
    t.string "phonenumber"
    t.string "image"
    t.string "job"
    t.text "notice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.string "email"
    t.index ["room_id"], name: "index_guests_on_room_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "price"
    t.integer "slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "area_id"
    t.bigint "admin_id"
    t.integer "deposit"
    t.index ["admin_id"], name: "index_rooms_on_admin_id"
    t.index ["area_id"], name: "index_rooms_on_area_id"
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_services_on_admin_id"
  end

  create_table "services_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "datebegin"
    t.date "dateend"
    t.integer "electbegin"
    t.integer "electend"
    t.integer "waterbegin"
    t.integer "waterend"
    t.integer "internet"
    t.integer "cleaner"
    t.integer "parking"
    t.integer "laundry"
    t.integer "option1"
    t.integer "option2"
    t.integer "option3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["room_id"], name: "index_services_rooms_on_room_id"
  end

  add_foreign_key "areas", "admins"
  add_foreign_key "backup_guests", "rooms"
  add_foreign_key "billings", "services_rooms"
  add_foreign_key "devices_rooms", "devices"
  add_foreign_key "devices_rooms", "rooms"
  add_foreign_key "guests", "rooms"
  add_foreign_key "rooms", "admins"
  add_foreign_key "rooms", "areas"
  add_foreign_key "services", "admins"
  add_foreign_key "services_rooms", "rooms"
end
