json.array!(@addresses) do |address|
  json.extract! address, :id, :address, :postal_code, :city
  json.url address_url(address, format: :json)
end
