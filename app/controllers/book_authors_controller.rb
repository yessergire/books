class BookAuthorsController < ApplicationController

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
        format.html { redirect_to :back, notice: 'Successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_author_params
    params.require(:book_author).permit(:book_id, :author_id)
  end
end
