json.array!(@food_places) do |food_place|
  json.extract! food_place, :id, :name, :address, :phone, :website
  json.url food_place_url(food_place, format: :json)
end
