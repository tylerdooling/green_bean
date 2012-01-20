class Food < ActiveRecord::Base
  validates :name, :food_group, :measurement_unit, :calories, :presence => true
  validates :food_group, :inclusion => { :in => %w(grains fruits vegetables dairy meats nuts fats spices), :message => "%{value} is not a valid food group" }
  validates :measurement_unit, :inclusion => { :in => %w(tsp tbsp cup oz lb piece can box stick jar roll whole), :message => "%{value} is not a valid measurement unit"}
  validates :calories, :numericality => { :only_integer => true }
end
