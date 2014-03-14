require 'spec_helper'

describe "publishers/new" do
  before(:each) do
    assign(:publisher, stub_model(Publisher,
      :name => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new publisher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", publishers_path, "post" do
      assert_select "input#publisher_name[name=?]", "publisher[name]"
      assert_select "input#publisher_url[name=?]", "publisher[url]"
    end
  end
end
