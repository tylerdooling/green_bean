class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.string :measurement_unit
      t.integer :calories_per_unit
      t.string :food_group

      t.timestamps
    end
  end
end
