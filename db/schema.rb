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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130110165135) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "media_id"
    t.string   "slug"
  end

  add_index "clients", ["slug"], :name => "index_clients_on_slug", :unique => true

  create_table "companies", :force => true do |t|
    t.string "name"
    t.string "address"
    t.string "address_2"
    t.string "email"
    t.string "phone"
    t.string "city"
    t.string "zipcode"
    t.text   "country"
    t.string "vat"
    t.string "fiscal"
    t.string "iban"
    t.string "swift"
    t.string "timestamps"
  end

  create_table "discounts", :force => true do |t|
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_details", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "participants_n"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "invoice_numbers", :force => true do |t|
    t.integer  "year"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "invoices", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "doc_id"
    t.integer  "client_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "tax_id"
    t.integer  "year"
    t.integer  "discount_id"
    t.integer  "invoice_id"
    t.string   "status"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "quantity"
    t.float    "unit_price"
    t.integer  "discount"
    t.integer  "invoice_id"
  end

  create_table "job_positions", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "media_assets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
    t.integer  "category"
  end

# Could not dump table "posts" because of following StandardError
#   Unknown type 'tumblr_id' for column 'integer'

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "services", ["slug"], :name => "index_services_on_slug", :unique => true

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "work_id"
    t.string   "slug"
  end

  add_index "tags", ["slug"], :name => "index_tags_on_slug", :unique => true
  add_index "tags", ["work_id"], :name => "index_tags_on_work_id"

  create_table "taxes", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "teammates", :force => true do |t|
    t.string   "fullname"
    t.text     "bio"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "work_id"
    t.integer  "service_id"
    t.boolean  "is_public"
    t.string   "job_position_id"
    t.integer  "post_id"
    t.integer  "year"
    t.integer  "media_id"
    t.string   "slug"
  end

  add_index "teammates", ["slug"], :name => "index_teammates_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "slug"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

  create_table "works", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "client_id"
    t.integer  "teammate_id"
    t.integer  "media_id"
    t.integer  "service_id"
    t.boolean  "is_public"
    t.boolean  "is_recap"
    t.boolean  "is_event"
    t.integer  "event_id"
    t.integer  "cover_image"
    t.integer  "year"
    t.string   "slug"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "behance"
    t.string   "tumblr"
    t.string   "pinterest"
    t.string   "status"
    t.integer  "updated_on"
    t.string   "project_id"
  end

  add_index "works", ["slug"], :name => "index_works_on_slug", :unique => true

end
