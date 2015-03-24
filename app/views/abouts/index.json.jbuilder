json.array!(@abouts) do |about|
  json.extract! about, :id, :title, :content
  json.url about_url(about, format: :json)
end
