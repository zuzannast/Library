json.array!(@books) do |book|
  json.extract! book, :title, :author_id
  json.url book_url(book, format: :json)
end
