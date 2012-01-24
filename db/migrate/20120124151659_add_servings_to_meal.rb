class AddServingsToMeal < ActiveRecord::Migration
  def up
    add_column :meals, :servings, :integer
  end

  def down
    remove_column :meals, :servings
  end
end
