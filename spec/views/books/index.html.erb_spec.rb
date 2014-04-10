require 'spec_helper'

describe "books/index" do
  before(:each) do
    assign(:books, [
      stub_model(Book,
        :name => "Book123",
        :plot => "MyText"
      ),
      stub_model(Book,
        :name => "Name",
        :plot => "MyText"
      )
    ])
  end

  it "renders a list of books" do
    visit books_path
    save_and_open_page
    expect(page).to have_content 'Book123'
    render
  end
end
