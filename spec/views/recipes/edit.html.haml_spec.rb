require 'spec_helper'

describe "recipes/edit" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :name => "MyString",
      :recipe_type => "MyString",
      :servings => 1,
      :prep_time => 1,
      :cook_time => 1,
      :ingredients => nil,
      :tags => nil,
      :rating => 1,
      :instructions => "MyText"
    ))
  end

  it "renders the edit recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipes_path(@recipe), :method => "post" do
      assert_select "input#recipe_name", :name => "recipe[name]"
      assert_select "input#recipe_recipe_type", :name => "recipe[recipe_type]"
      assert_select "input#recipe_servings", :name => "recipe[servings]"
      assert_select "input#recipe_prep_time", :name => "recipe[prep_time]"
      assert_select "input#recipe_cook_time", :name => "recipe[cook_time]"
      assert_select "input#recipe_ingredients", :name => "recipe[ingredients]"
      assert_select "input#recipe_tags", :name => "recipe[tags]"
      assert_select "input#recipe_rating", :name => "recipe[rating]"
      assert_select "textarea#recipe_instructions", :name => "recipe[instructions]"
    end
  end
end
