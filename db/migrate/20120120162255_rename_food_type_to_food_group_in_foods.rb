class RenameFoodTypeToFoodGroupInFoods < ActiveRecord::Migration
  def up
    rename_column :foods, :food_type, :food_group
  end

  def down
  end
end
