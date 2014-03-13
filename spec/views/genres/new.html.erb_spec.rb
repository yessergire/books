require 'spec_helper'

describe "genres/new" do
  before(:each) do
    assign(:genre, stub_model(Genre,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new genre form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", genres_path, "post" do
      assert_select "input#genre_name[name=?]", "genre[name]"
      assert_select "textarea#genre_description[name=?]", "genre[description]"
    end
  end
end
