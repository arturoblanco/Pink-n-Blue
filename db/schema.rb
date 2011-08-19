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

ActiveRecord::Schema.define(:version => 20110819152634) do

  create_table "articles", :force => true do |t|
    t.integer  "product_id"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_products", :force => true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.float    "price_for_sale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.string   "color"
  end

  create_table "carts", :force => true do |t|
    t.datetime "checkout_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["id"], :name => "index_categories_on_id", :unique => true
  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "category_subcategories", :force => true do |t|
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_subcategories", ["category_id"], :name => "index_category_subcategories_on_category_id"
  add_index "category_subcategories", ["id"], :name => "index_category_subcategories_on_id", :unique => true
  add_index "category_subcategories", ["subcategory_id"], :name => "index_category_subcategories_on_subcategory_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price_for_sale"
    t.float    "discount"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["id"], :name => "index_products_on_id", :unique => true
  add_index "products", ["name"], :name => "index_products_on_name", :unique => true

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["id"], :name => "index_subcategories_on_id", :unique => true
  add_index "subcategories", ["name"], :name => "index_subcategories_on_name", :unique => true

end
