require 'spec_helper'

describe "ingredients/new" do
  before(:each) do
    assign(:ingredient, stub_model(Ingredient,
      :quantity => 1
    ).as_new_record)
  end

  it "renders new ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ingredients_path, :method => "post" do
      assert_select "input#ingredient_quantity", :name => "ingredient[quantity]"
    end
  end
end
