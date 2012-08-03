class Meal < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  has_many :scheduled_meals

  def calories_per_serving
    self.recipes.inject(0) { |r, e| r + e.calories_per_serving }
  end

  def shopping_list(servings)
    self.recipes.inject({}) do |hash, r|
      hash.merge(r.scaled_for(servings).shopping_list) { |key, ov, nv| ov + nv }
    end
  end

 end
