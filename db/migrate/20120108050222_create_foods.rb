class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.string :measurement_unit
      t.integer :calories
      t.string :food_type

      t.timestamps
    end
  end
end
