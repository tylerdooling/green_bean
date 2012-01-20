class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :quantity
      t.references :item, :polymorphic => true
      t.references :recipe

      t.timestamps
    end
  end
end
