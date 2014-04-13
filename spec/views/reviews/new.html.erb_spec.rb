require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :text => "MyString",
      :score => 1,
      :user_id => 1,
      :book_id => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input#review_text[name=?]", "review[text]"
      assert_select "input#review_score[name=?]", "review[score]"
      assert_select "input#review_user_id[name=?]", "review[user_id]"
      assert_select "input#review_book_id[name=?]", "review[book_id]"
    end
  end
end
