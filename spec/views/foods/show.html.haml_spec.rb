require 'spec_helper'

describe "foods/show" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "Name",
      :description => "MyText",
      :measurement_unit => "Measurement Unit",
      :calories => 1,
      :food_type => "Food Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Measurement Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Food Type/)
  end
end
