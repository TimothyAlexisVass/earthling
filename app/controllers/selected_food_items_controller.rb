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
    SelectedFoodItem.destroy(params[:id])
    redirect_to nutrition_path
  end

  def clear_all
    SelectedFoodItem.where(user_id: params[:user_id]).destroy_all
    redirect_to nutrition_path
  end

  def show
  end

  private

    def selected_food_item_params
      params.require(:selected_food_item).permit(
        :user_id, :food_item_id, :amount
      )
    end
end
