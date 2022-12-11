class User < ApplicationRecord
  before_save :downcase_email

  belongs_to :selected_food_item

  validates :name, length: { minimum: 2, maximum: 255 },
                   format: { with: /\A[A-Za-z\u00C0-\u00FF][A-Za-z\u00C0-\u00FF\'\-]+([\ A-Za-z\u00C0-\u00FF][A-Za-z\u00C0-\u00FF\'\-]+)*/ }
  validates :email, length: { maximum: 255 },
                    format: URI::MailTo::EMAIL_REGEXP,
                    uniqueness: { case_sensitive: false }
  validates_presence_of :name, :email, :weight, :height,
                        :refined_carbohydrates, :learning, :plans_motivation,
                        :denatured_macronutrients, :nutritional_requirement,
                        :nutritionally_dense, :tattoos, :align_with_facts,
                        :avoid_carcinogens, :avoid_excess_salt,
                        :enjoy_daily_activities, :alcohol, :smoking,
                        :regulated_alkaloids, :unregulated_alkaloids,
                        :physical_activity, :stretching_resting, :economy,
                        :exercise_presence, :posture, :outdoors, :sleep_amount,
                        :hormone_disturbing, :relationships, :leisure_time
  
  private
    def downcase_email
      email.downcase!
    end

end
