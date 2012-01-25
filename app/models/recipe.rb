class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :meals

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |i| i[:item_id].blank? }
  accepts_nested_attributes_for :tags, :reject_if => lambda { |t| t[:name].blank? }

  validates :recipe_type, :inclusion => { :in => %w(appetizer side entre dessert), :message => "%{value} is not a valid type" }

  def single_serving
    self.ingredients.inject(0) { |r, e| r + e.calories } / self.servings
  end
end
