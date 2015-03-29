json.array!(@contacts) do |contact|
  json.extract! contact, :id, :Address, :city, :phone, :email, :working_time
  json.url contact_url(contact, format: :json)
end
