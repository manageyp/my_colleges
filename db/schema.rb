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

ActiveRecord::Schema.define(:version => 20130506061757) do

  create_table "cities", :force => true do |t|
    t.integer  "province_id", :null => false
    t.string   "nick_name"
    t.string   "real_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cities", ["nick_name"], :name => "index_cities_on_nick_name"
  add_index "cities", ["province_id"], :name => "index_cities_on_province_id"
  add_index "cities", ["real_name"], :name => "index_cities_on_real_name"

  create_table "countries", :force => true do |t|
    t.string   "nick_name"
    t.string   "real_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "countries", ["nick_name"], :name => "index_countries_on_nick_name"
  add_index "countries", ["real_name"], :name => "index_countries_on_real_name"

  create_table "domestics", :force => true do |t|
    t.string   "college_type"
    t.string   "is_211"
    t.string   "is_985"
    t.string   "affiliate"
    t.string   "is_edu_affiliate"
    t.string   "has_bachelor"
    t.string   "is_independent"
    t.string   "is_civilian_run"
    t.integer  "key_disciplines"
    t.integer  "master_num"
    t.integer  "phd_num"
    t.integer  "academician_num"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "domestics", ["affiliate"], :name => "index_domestics_on_affiliate"
  add_index "domestics", ["college_type"], :name => "index_domestics_on_college_type"
  add_index "domestics", ["has_bachelor"], :name => "index_domestics_on_has_bachelor"
  add_index "domestics", ["is_211"], :name => "index_domestics_on_is_211"
  add_index "domestics", ["is_985"], :name => "index_domestics_on_is_985"
  add_index "domestics", ["is_civilian_run"], :name => "index_domestics_on_is_civilian_run"
  add_index "domestics", ["is_edu_affiliate"], :name => "index_domestics_on_is_edu_affiliate"

  create_table "provinces", :force => true do |t|
    t.integer  "country_id", :null => false
    t.string   "nick_name"
    t.string   "real_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "provinces", ["country_id"], :name => "index_provinces_on_country_id"
  add_index "provinces", ["nick_name"], :name => "index_provinces_on_nick_name"
  add_index "provinces", ["real_name"], :name => "index_provinces_on_real_name"

  create_table "school_introductions", :force => true do |t|
    t.integer  "school_id",     :null => false
    t.string   "short_content"
    t.text     "full_content"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "school_introductions", ["school_id"], :name => "index_school_introductions_on_school_id", :unique => true

  create_table "school_photos", :force => true do |t|
    t.integer  "school_id"
    t.string   "photo_url"
    t.boolean  "is_avatar",  :default => false
    t.string   "status"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "school_photos", ["school_id"], :name => "index_school_photos_on_school_id"

  create_table "schools", :force => true do |t|
    t.string   "detail_type", :null => false
    t.integer  "detail_id",   :null => false
    t.integer  "country_id"
    t.integer  "province_id"
    t.integer  "city_id"
    t.string   "nick_name"
    t.string   "real_name"
    t.string   "web_site"
    t.string   "found_year"
    t.string   "ifeng_code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "address"
    t.string   "telephone"
    t.string   "sina_code"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "zipcode"
  end

  add_index "schools", ["city_id"], :name => "index_schools_on_city_id"
  add_index "schools", ["country_id"], :name => "index_schools_on_country_id"
  add_index "schools", ["detail_type", "detail_id"], :name => "index_schools_on_detail_type_and_detail_id", :unique => true
  add_index "schools", ["nick_name"], :name => "index_schools_on_nick_name"
  add_index "schools", ["province_id"], :name => "index_schools_on_province_id"
  add_index "schools", ["real_name"], :name => "index_schools_on_real_name"

end
