class SelectedFoodItem < ApplicationRecord
  has_many :food_items
  belongs_to :user

  validates_presence_of :user_id, :food_item_id, :amount
end