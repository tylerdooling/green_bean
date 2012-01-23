class Recipe < ActiveRecord::Base
  has_many :ingredients
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :meals

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |i| i[:item_id].blank? }
  accepts_nested_attributes_for :tags, :reject_if => lambda { |t| t[:name].blank? }
end
