class CreateScheduledMeals < ActiveRecord::Migration
  def change
    create_table :scheduled_meals do |t|
      t.string :meal_time
      t.datetime :meal_date
      t.references :meal
      t.integer :servings

      t.timestamps
    end
    add_index :scheduled_meals, :meal_id
  end
end
