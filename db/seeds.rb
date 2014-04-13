artima = Publisher.create name: "Artima", url: "http://www.artima.com/"

pins = Book.create name: "Programming in Scala, First Edition", plot: "Programming in Scala by Martin Odersky (the creator of Scala), Lex Spoon and Bill Venners is the definitive guide to Scala.", publisher: artima
c_book = Book.create name: "C Programming", plot: "learn c"

odersky = Author.create name: "Martin Odersky"
lex = Author.create name: "Lex Spoon"
venners = Author.create name: "Bill Venners"

BookAuthor.create book: pins, author: odersky
BookAuthor.create book: pins, author: lex
BookAuthor.create book: pins, author: venners

it = Genre.create name: "IT", description: "Books about IT."
prog = Genre.create name: "Programming", description: "Books about programming."

BookGenre.create book: c_book, genre: it
BookGenre.create book: c_book, genre: prog
BookGenre.create book: pins, genre: it
BookGenre.create book: pins, genre: prog