class CreateSelectedFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_food_items do |t|
      t.references :user, foreign_key: true
      t.references :food_item, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
