class ScheduledMeal < ActiveRecord::Base
  belongs_to :meal

  before_save do
    self.meal_date = meal_date.to_date if meal_date
  end

  def self.find_all_meals_by_meal_date(date)
    self.find_all_by_meal_date(date).map { |sm| sm.meal }
  end
end
