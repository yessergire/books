require 'spec_helper'

describe "authors/index" do
  before(:each) do
    assign(:authors, [
      stub_model(Author,
        :born => 1,
        :died => 2,
        :info => "MyText"
      ),
      stub_model(Author,
        :born => 1,
        :died => 2,
        :info => "MyText"
      )
    ])
  end

  it "renders a list of authors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
