require 'spec_helper'

describe "meals/edit" do
  before(:each) do
    @meal = assign(:meal, stub_model(Meal,
      :name => "MyString"
    ))
  end

  it "renders the edit meal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meals_path(@meal), :method => "post" do
      assert_select "input#meal_name", :name => "meal[name]"
    end
  end
end
