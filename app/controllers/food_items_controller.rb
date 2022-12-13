class FoodItemsController < ApplicationController

  layout false, only: [:food_items_selection]

  def food_items_selection
    food_item_name = params[:food_item_name] || "."
    @food_items_selection = FoodItem.select("id", "name_en")
                                    .select{ |item| item.name_en.match?(/#{food_item_name}/i) }
                                    .map{ |item| "<li class='autocomplete-listitem' data-id='#{item.id}' data-name='#{item.name_en}'>#{item.name_en}</li>" }
                                    .join("");
  end

  def test

  end
end
