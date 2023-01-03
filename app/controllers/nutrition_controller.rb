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
    @micro_nutrients = micro_nutrients
    @units = units
    @daily_requirements = daily_requirements
    @upper_limit = upper_limit

    @totals = totals
    @total_polyunsaturated = total_polyunsaturated
    @total_omega3 = total_omega3
    @total_omega6 = total_omega6
    @omega3percent = percent(@total_omega3/@total_polyunsaturated) if @total_polyunsaturated > 0 
    @omega6percent = (@total_omega3 > 0 ? (100 - @omega3percent) : 100).round(2)
    if @totals[:energy] > 0
      @carbohydrates_energy = (kcal_per_gram(:carbohydrates) * @totals[:carbohydrates]).round(1)
      @carbohydrates_percent = percent(@carbohydrates_energy.to_f / @totals[:energy])

      @fat_energy = set_decimal_precision(kcal_per_gram(:fat) * @totals[:fat])
      @fat_percent = percent(@fat_energy.to_f / @totals[:energy])

      @protein_energy = set_decimal_precision(kcal_per_gram(:protein) * @totals[:protein])
      @protein_percent = percent(@protein_energy.to_f / @totals[:energy])

      @fiber_energy = set_decimal_precision(kcal_per_gram(:fiber) * @totals[:fiber])
      @fiber_percent = (100 - @protein_percent - @fat_percent - @carbohydrates_percent).round(2)
    end
  end

  def top
    @field = params[:field]
    @amount = params[:amount].present? ? params[:amount].to_i : 10
    @need = params[:need]
    @units = units
    @top_list = get_top(@field, @amount)
    render layout: "only_main"
  end
end
