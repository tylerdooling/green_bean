require 'spec_helper'

describe "meals/index" do
  before(:each) do
    assign(:meals, [
      stub_model(Meal,
        :name => "Name"
      ),
      stub_model(Meal,
        :name => "Name"
      )
    ])
  end

  it "renders a list of meals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
