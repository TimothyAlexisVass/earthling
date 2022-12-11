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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_084654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

end
