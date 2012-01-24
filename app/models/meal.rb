class Meal < ActiveRecord::Base
  has_and_belongs_to_many :recipes

  def single_serving
    self.recipes.inject(0) { |r, e| r + e.single_serving }
  end
end
