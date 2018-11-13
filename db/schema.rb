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

ActiveRecord::Schema.define(version: 20181109175518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "box_items", force: :cascade do |t|
    t.integer "box_id"
    t.integer "item_id"
    t.string "integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
  end

  create_table "boxes", force: :cascade do |t|
    t.string "subscription_level"
    t.string "month"
    t.string "year"
    t.string "title"
    t.boolean "shipped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "subscriber_box_id"
    t.boolean "received"
    t.integer "order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "image"
    t.integer "size"
    t.string "URL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "box_item_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subscription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "quantity"
    t.boolean "cancellation"
  end

  create_table "ordersofboxes", force: :cascade do |t|
    t.integer "order_id"
    t.integer "box_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "access_level"
    t.integer "role_type"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "level"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rate"
    t.integer "order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "admin"
    t.boolean "visitor"
    t.boolean "subscriber"
    t.integer "current_box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.integer "subscription_id"
    t.string "role"
    t.integer "role_id"
    t.string "access_level"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
