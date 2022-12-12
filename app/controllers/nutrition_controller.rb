class NutritionController < ApplicationController
  def show
    @user = User.first
    @food_list = get_food_list
    @total_amount = total_amount
    @total_energy = total_energy
  end

  private

    def get_food_list
      list = SelectedFoodItem.where(user_id: @user.id).map{ |selected_food_item|
        {
          data: (food_item=FoodItem.where(id: selected_food_item.food_item_id).first),
          amount: selected_food_item.amount,
          energy: food_item[:energy]*selected_food_item.amount/100.0
        }
      }
    end

    def total_amount
      @food_list.sum{ |item| item[:amount] }
    end

    def total_energy
      @food_list.sum{ |item| item[:data][:energy].to_f }
    end
end
