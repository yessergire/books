class BookAuthorsController < ApplicationController

  def index
    @book_id = params[:book_id]
    @book = Book.find @book_id
    unless @book_id.nil?
      @book_authors = BookAuthor.where(book_id: @book_id)
    else
      @book_authors = BookAuthor.all
    end
  end

  def new
    @book_author = BookAuthor.new
    @authors = Author.all
    @books = Book.all
    @book_id = params[:book_id]
  end

  def create
    @book_author = BookAuthor.new(book_author_params)

    respond_to do |format|
      if @book_author.save
        format.html { redirect_to book_authors_path(params: {book_id: @book_author.book.id}), notice: 'Successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @book_author = BookAuthor.find(params[:id])
    @book_author.destroy
    respond_to do |format|
      format.html { redirect_to  book_authors_path(params: {book_id: @book_author.book.id}) }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_author_params
    params.require(:book_author).permit(:book_id, :author_id)
  end
end
