require 'spec_helper'

describe "meals/new" do
  before(:each) do
    assign(:meal, stub_model(Meal,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new meal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => meals_path, :method => "post" do
      assert_select "input#meal_name", :name => "meal[name]"
    end
  end
end
