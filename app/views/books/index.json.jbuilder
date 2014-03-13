json.array!(@books) do |book|
  json.extract! book, :id, :name, :plot
  json.url book_url(book, format: :json)
end
