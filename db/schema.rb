# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_12_194532) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string "name_se"
    t.string "name_en"
    t.integer "energy"
    t.decimal "carbohydrates", precision: 10, scale: 2
    t.decimal "fat", precision: 10, scale: 2
    t.decimal "protein", precision: 10, scale: 2
    t.decimal "fiber", precision: 10, scale: 2
    t.decimal "water", precision: 10, scale: 2
    t.decimal "monosaccharides", precision: 10, scale: 2
    t.decimal "disaccharides", precision: 10, scale: 2
    t.decimal "sucrose", precision: 10, scale: 2
    t.decimal "sugars", precision: 10, scale: 2
    t.decimal "saturated", precision: 10, scale: 2
    t.decimal "saturated_4_0to10_0", precision: 10, scale: 2
    t.decimal "lauric_acid_c12_0", precision: 10, scale: 2
    t.decimal "myristic_acid_c14_0", precision: 10, scale: 2
    t.decimal "palmitic_acid_c16_0", precision: 10, scale: 2
    t.decimal "stearic_acid_c18_0", precision: 10, scale: 2
    t.decimal "arachidic_acid_c20_0", precision: 10, scale: 2
    t.decimal "monounsaturated", precision: 10, scale: 2
    t.decimal "palmitoleic_acid_c16_1", precision: 10, scale: 2
    t.decimal "oleic_acid_c18_1", precision: 10, scale: 2
    t.decimal "polyunsturated", precision: 10, scale: 2
    t.decimal "linoleic_acid_c18_2", precision: 10, scale: 2
    t.decimal "linolenic_acid_c18_3", precision: 10, scale: 2
    t.decimal "arachidonic_acid_c20_4", precision: 10, scale: 2
    t.decimal "epa_c20_5", precision: 10, scale: 2
    t.decimal "dpa_c22_5", precision: 10, scale: 2
    t.decimal "dha_c22_6", precision: 10, scale: 2
    t.decimal "cholesterol", precision: 10, scale: 2
    t.decimal "retinol", precision: 10, scale: 2
    t.decimal "vitamin_a", precision: 10, scale: 2
    t.decimal "beta_carotene", precision: 10, scale: 2
    t.decimal "vitamin_d", precision: 10, scale: 2
    t.decimal "vitamin_e", precision: 10, scale: 2
    t.decimal "vitamin_k", precision: 10, scale: 2
    t.decimal "thiamine", precision: 10, scale: 2
    t.decimal "riboflavin", precision: 10, scale: 2
    t.decimal "vitamin_c", precision: 10, scale: 2
    t.decimal "niacin", precision: 10, scale: 2
    t.decimal "niacin_equivalents", precision: 10, scale: 2
    t.decimal "vitamin_b6", precision: 10, scale: 2
    t.decimal "vitamin_b12", precision: 10, scale: 2
    t.decimal "folate", precision: 10, scale: 2
    t.decimal "phosphorus", precision: 10, scale: 2
    t.decimal "iodine", precision: 10, scale: 2
    t.decimal "iron", precision: 10, scale: 2
    t.decimal "calcium", precision: 10, scale: 2
    t.decimal "potassium", precision: 10, scale: 2
    t.decimal "copper", precision: 10, scale: 2
    t.decimal "magnesium", precision: 10, scale: 2
    t.decimal "sodium", precision: 10, scale: 2
    t.decimal "sodium_chloride", precision: 10, scale: 2
    t.decimal "selenium", precision: 10, scale: 2
    t.decimal "zinc", precision: 10, scale: 2
    t.decimal "starch", precision: 10, scale: 2
    t.integer "waste"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selected_food_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "food_item_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_item_id"], name: "index_selected_food_items_on_food_item_id"
    t.index ["user_id"], name: "index_selected_food_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.integer "weight"
    t.integer "height"
    t.integer "refined_carbohydrates"
    t.integer "learning"
    t.integer "plans_motivation"
    t.integer "denatured_macronutrients"
    t.integer "nutritional_requirement"
    t.integer "nutritionally_dense"
    t.integer "tattoos"
    t.integer "align_with_facts"
    t.integer "avoid_carcinogens"
    t.integer "avoid_excess_salt"
    t.integer "enjoy_daily_activities"
    t.integer "alcohol"
    t.integer "smoking"
    t.integer "regulated_alkaloids"
    t.integer "unregulated_alkaloids"
    t.integer "physical_activity"
    t.integer "stretching_resting"
    t.integer "exercise_presence"
    t.integer "posture"
    t.integer "outdoors"
    t.integer "sleep_amount"
    t.integer "hormone_disturbing"
    t.integer "relationships"
    t.integer "leisure_time"
    t.integer "economy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.integer "age"
  end

  add_foreign_key "selected_food_items", "food_items"
  add_foreign_key "selected_food_items", "users"
end
