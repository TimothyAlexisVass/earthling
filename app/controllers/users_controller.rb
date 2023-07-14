class UsersController < ApplicationController
  def new
    @user = User.new
    @genders = [:male, :female]
  end

  def create
    puts user_params
    if User.exists?(email: user_params[:email].downcase)
      flash[:danger] = "A user with that email already exists"
      render 'new'
    else
      User.create(user_params)
      flash[:success] = "Your answers have been submitted."
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :name, :email, :phone, :weight, :height, :gender,
        :refined_carbohydrates, :learning, :plans_motivation,
        :denatured_macronutrients, :nutritional_requirement,
        :nutritionally_dense, :tattoos, :align_with_facts,
        :avoid_carcinogens, :avoid_excess_salt,
        :enjoy_daily_activities, :alcohol, :smoking,
        :regulated_alkaloids, :unregulated_alkaloids,
        :physical_activity, :stretching_resting, :economy,
        :exercise_presence, :posture, :outdoors, :sleep_amount,
        :hormone_disturbing, :relationships, :leisure_time
      )
    end

end
