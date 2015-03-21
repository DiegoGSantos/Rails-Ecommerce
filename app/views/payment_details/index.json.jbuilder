json.array!(@payment_details) do |payment_detail|
  json.extract! payment_detail, :id, :customer_id, :card_holder_name, :card_number_string, :card_valid_date
  json.url payment_detail_url(payment_detail, format: :json)
end
