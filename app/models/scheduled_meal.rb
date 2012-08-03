class ScheduledMeal < ActiveRecord::Base
  belongs_to :meal

  before_save do
    self.meal_date = meal_date.to_date if meal_date
  end

  def self.by_date(date)
    self.find_all_by_meal_date(date)
  end

  def self.by_week(week)
    meals = []
    first_day_of_week = week.weeks.since(Time.local(Time.now.year))
    (0..6).to_a.each do |e| meals << self.by_date(first_day_of_week + e.day) end
    meals.flatten
  end

  def shopping_list
    meal.shopping_list self.servings
  end
end
