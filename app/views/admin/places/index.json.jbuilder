json.array!(@places) do |place|
  json.extract! place, :id, :alias, :street, :city, :postalCode
  json.url place_url(place, format: :json)
end
