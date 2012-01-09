require 'spec_helper'

describe "ingredients/show" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :quantity => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
