class NutritionController < ApplicationController
  def show
    @user = User.first
    @food_list = get_food_list
  end

  def get_food_list
    SelectedFoodItem.where(user_id: @user.id).map{ |e|
      {
        data: FoodItem.where(id: e.food_item_id).first,
        amount: e.amount
      }
    }
  end
end
