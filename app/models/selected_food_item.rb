class SelectedFoodItem < ApplicationRecord
  has_many :food_items
  has_many :users

  validates_presence_of :user_id, :food_item_id, :amount
end