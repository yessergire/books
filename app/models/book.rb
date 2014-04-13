class Book < ActiveRecord::Base
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :publisher
  def to_s
    name
  end
end
