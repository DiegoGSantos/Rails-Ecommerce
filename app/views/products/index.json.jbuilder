json.array!(@products) do |product|
  json.extract! product, :id, :category_id, :name, :description, :description_long, :price, :stock_quantity, :image_url
  json.url product_url(product, format: :json)
end
