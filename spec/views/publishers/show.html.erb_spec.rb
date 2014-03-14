require 'spec_helper'

describe "publishers/show" do
  before(:each) do
    @publisher = assign(:publisher, stub_model(Publisher,
      :name => "Name",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
  end
end
