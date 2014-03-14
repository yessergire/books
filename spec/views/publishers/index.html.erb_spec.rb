require 'spec_helper'

describe "publishers/index" do
  before(:each) do
    assign(:publishers, [
      stub_model(Publisher,
        :name => "Name",
        :url => "Url"
      ),
      stub_model(Publisher,
        :name => "Name",
        :url => "Url"
      )
    ])
  end

  it "renders a list of publishers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
