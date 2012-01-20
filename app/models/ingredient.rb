class Ingredient < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  belongs_to :recipe

  delegate :name, :to => :item

  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }, :unless => lambda { |i| i.item.nil? }
  validates :item_type, :inclusion => { :in => %w(Food Recipe), :message => "%{value} is not a valid ingredient" }
end
