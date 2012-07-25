class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, :numericality => {:greater_than => 0 }
  validates :measurement_unit, :inclusion => { :in => %w(tsp tbsp cup oz lb piece can box stick jar roll whole), :message => "%{value} is not a valid measurement unit"}

  def calories
    quantity.to_i * (ingredient.try(:calories_per_unit, self.measurement_unit) || 0)
  end
end
