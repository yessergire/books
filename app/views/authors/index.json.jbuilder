json.array!(@authors) do |author|
  json.extract! author, :id, :born, :died, :info
  json.url author_url(author, format: :json)
end
