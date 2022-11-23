class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :weight
      t.integer :length
      t.integer :refined_carbohydrates
      t.integer :learning
      t.integer :plans_motivation
      t.integer :denatured_macronutrients
      t.integer :nutritional_requirement
      t.integer :nutritionally_dense
      t.integer :tattoos
      t.integer :align_with_facts
      t.integer :avoid_carcinogens
      t.integer :avoid_excess_salt
      t.integer :enjoy_daily_activities
      t.integer :alcohol
      t.integer :smoking
      t.integer :regulated_alkaloids
      t.integer :unregulated_alkaloids
      t.integer :physical_activity
      t.integer :stretching_resting
      t.integer :exercise_presence
      t.integer :posture
      t.integer :outdoors
      t.integer :sleep_amount
      t.integer :hormone_disturbing
      t.integer :relationships
      t.integer :leisure_time
      t.integer :economy

      t.timestamps
    end
  end
end
