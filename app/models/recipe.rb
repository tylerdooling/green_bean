class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :meals

  accepts_nested_attributes_for :recipe_ingredients, :reject_if => lambda { |i| i[:ingredient_id].blank? || i[:quantity].blank? }
  accepts_nested_attributes_for :tags, :reject_if => lambda { |t| t[:name].blank? }

  validates :name, :servings, :presence => true
  validates :recipe_type, :inclusion => { :in => %w(appetizer side entre dessert), :message => "%{value} is not a valid type" }
  validates :servings, :numericality => { :only_integer => true }

  def single_serving
    self.recipe_ingredients.inject(0) { |r, e| r + e.ingredient.calories_per_unit } / self.servings
  end
end
