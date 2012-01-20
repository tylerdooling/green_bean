class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :recipe_type
      t.integer :servings
      t.integer :prep_time
      t.integer :cook_time
      t.integer :rating
      t.text :instructions

      t.timestamps
    end
  end
end
