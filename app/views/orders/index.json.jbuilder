json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :status, :pst_rate, :gst_rate, :hst_rate
  json.url order_url(order, format: :json)
end
