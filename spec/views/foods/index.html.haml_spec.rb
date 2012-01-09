require 'spec_helper'

describe "foods/index" do
  before(:each) do
    assign(:foods, [
      stub_model(Food,
        :name => "Name",
        :description => "MyText",
        :measurement_unit => "Measurement Unit",
        :calories => 1,
        :food_type => "Food Type"
      ),
      stub_model(Food,
        :name => "Name",
        :description => "MyText",
        :measurement_unit => "Measurement Unit",
        :calories => 1,
        :food_type => "Food Type"
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Measurement Unit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Food Type".to_s, :count => 2
  end
end
