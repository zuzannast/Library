json.array!(@reservations) do |reservation|
  json.extract! reservation, :user, :book_id
  json.url reservation_url(reservation, format: :json)
end
