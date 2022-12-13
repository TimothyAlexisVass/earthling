class NutritionController < ApplicationController
  include NutritionHelper

  def show
    @selected_food_item = SelectedFoodItem.new
    @user = User.first
    @food_list = get_food_list
    @activity_level = [1, 1.12, 1.20, 1.28][@user.physical_activity]
    @gender_multiplier = @user.gender === "male" ? 1.25 : 1
    @weight = @user.weight
    @show_all_nutrients = false

    @field_names = field_names_en
    @units = units
    @daily_requirements = daily_requirements
    @upper_limit = upper_limit

    @totals = totals
    @total_polyunsaturated = total_polyunsaturated
    @total_omega3 = total_omega3
    @total_omega6 = total_omega6
    @omega3percent = (100 * @total_omega3/@total_polyunsaturated).round(2)
    @omega6percent = @total_omega3 > 0 ? (100 - @omega3percent) : 100

    @carbohydrates_energy = (kcal_per_gram(:carbohydrates) * @totals[:carbohydrates]).round(1)
    @carbohydrates_percent = percent(@carbohydrates_energy / @totals[:energy])

    @fat_energy = (kcal_per_gram(:fat) * @totals[:fat]).round(1)
    @fat_percent = percent(@fat_energy / @totals[:energy])

    @protein_energy = (kcal_per_gram(:protein) * @totals[:protein]).round(1)
    @protein_percent = percent(@protein_energy / @totals[:energy])

    @fiber_energy = (kcal_per_gram(:fiber) * @totals[:fiber]).round(1)
    @fiber_percent = (100 - @protein_percent - @fat_percent - @carbohydrates_percent).round(2)
  end
end
