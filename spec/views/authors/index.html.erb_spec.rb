require 'spec_helper'

describe "authors/index" do
  before(:each) do
    assign(:authors, [
      stub_model(Author, :name => "Author 1"),
      stub_model(Author, :name => "Author 2")
    ])
  end

  it "renders a list of authors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "li", :text => "Author 1"
    assert_select "li", :text => "Author 2"
  end
end
