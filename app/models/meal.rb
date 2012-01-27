class Meal < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  has_many :scheduled_meals

  def single_serving
    self.recipes.inject(0) { |r, e| r + e.single_serving }
  end

  def self.find_all_by_scheduled_date(day)
    []
  end
end
