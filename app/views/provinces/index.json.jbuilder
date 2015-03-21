json.array!(@provinces) do |province|
  json.extract! province, :id, :province_name, :short_name, :pst_rate, :gst_rate, :hst_rate
  json.url province_url(province, format: :json)
end
