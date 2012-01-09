require 'spec_helper'

describe "foods/edit" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "MyString",
      :description => "MyText",
      :measurement_unit => "MyString",
      :calories => 1,
      :food_type => "MyString"
    ))
  end

  it "renders the edit food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foods_path(@food), :method => "post" do
      assert_select "input#food_name", :name => "food[name]"
      assert_select "textarea#food_description", :name => "food[description]"
      assert_select "input#food_measurement_unit", :name => "food[measurement_unit]"
      assert_select "input#food_calories", :name => "food[calories]"
      assert_select "input#food_food_type", :name => "food[food_type]"
    end
  end
end
