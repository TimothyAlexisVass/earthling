class SelectedFoodItemsController < ApplicationController
  def create
    @selected_food_item = SelectedFoodItem.new(selected_food_item_params)
    if @selected_food_item.save
      redirect_to nutrition_path
    else
      flash[:error] = "Error"
    end
  end

  def destroy
    @selected_food_item = SelectedFoodItem.where(user_id: params.user_id).where(food_item_id: params.food_item_id)
  end

  private

    def selected_food_item_params
      params.require(:selected_food_item).permit(
        :user_id, :food_item_id, :amount
      )
    end
end
