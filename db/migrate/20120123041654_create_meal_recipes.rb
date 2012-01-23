class CreateMealRecipes < ActiveRecord::Migration
  def change
    create_table :meals_recipes do |t|
      t.integer :meal_id
      t.integer :recipe_id
    end
  end
end
