require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :text => "Text",
      :score => 1,
      :user_id => 2,
      :book_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Text/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
