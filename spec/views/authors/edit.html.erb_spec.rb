require 'spec_helper'

describe "authors/edit" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :born => 1,
      :died => 1,
      :info => "MyText"
    ))
  end

  it "renders the edit author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", author_path(@author), "post" do
      assert_select "input#author_born[name=?]", "author[born]"
      assert_select "input#author_died[name=?]", "author[died]"
      assert_select "textarea#author_info[name=?]", "author[info]"
    end
  end
end
