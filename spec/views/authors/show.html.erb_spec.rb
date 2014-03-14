require 'spec_helper'

describe "authors/show" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :born => 1,
      :died => 2,
      :info => "MyText"
    ))
  end

  it "renders info in <p>" do
    render
    rendered.should match(/MyText/)
  end
end
