class BookGenresController < ApplicationController

  def index
    @book_id = params[:book_id]
    @book = Book.find @book_id
    unless @book_id.nil?
      @book_genres = BookGenre.where(book_id: @book_id)
    else
      @book_genres = BookGenre.all
    end
  end

  def new
    @book_genre = BookGenre.new
    @genres = Genre.all
    @books = Book.all
    @book_id = params[:book_id]
  end

  def create
    @book_genre = BookGenre.new(book_author_params)

    respond_to do |format|
      if @book_genre.save
        format.html { redirect_to book_genres_path(params: {book_id: @book_genre.book.id}), notice: 'Successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @book_genre = BookGenre.find(params[:id])
    @book_genre.destroy
    respond_to do |format|
      format.html { redirect_to book_genres_path(params: {book_id: @book_genre.book.id}) }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_author_params
    params.require(:book_genre).permit(:book_id, :genre_id)
  end
end
