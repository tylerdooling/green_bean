class Ingredient < ActiveRecord::Base
  has_many :recipe_ingredients

  validates :name, :food_group, :measurement_unit, :calories_per_unit, :presence => true
  validates :food_group, :inclusion => { :in => %w(grains fruits vegetables dairy meats nuts fats spices), :message => "%{value} is not a valid food group" }
  validates :calories_per_unit, :numericality => { :only_integer => true }
end
