class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.string :measurement_unit
      t.float :quantity

      t.references :recipe
      t.references :ingredient

      t.timestamps
    end
  end
end
