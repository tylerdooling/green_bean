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

ActiveRecord::Schema.define(:version => 20120127002520) do

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "measurement_unit"
    t.float    "calories_per_unit"
    t.string   "food_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals_recipes", :force => true do |t|
    t.integer "meal_id"
    t.integer "recipe_id"
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.string   "measurement_unit"
    t.float    "quantity"
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "recipe_type"
    t.float    "servings"
    t.integer  "prep_time"
    t.integer  "cook_time"
    t.integer  "rating"
    t.text     "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes_tags", :force => true do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  create_table "scheduled_meals", :force => true do |t|
    t.string   "meal_time"
    t.datetime "meal_date"
    t.integer  "meal_id"
    t.float    "servings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scheduled_meals", ["meal_id"], :name => "index_scheduled_meals_on_meal_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
