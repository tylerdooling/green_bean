class CreateRecipeTags < ActiveRecord::Migration
  def change
    create_table :recipes_tags do |t|
      t.integer :recipe_id
      t.integer :tag_id
    end
  end
end
