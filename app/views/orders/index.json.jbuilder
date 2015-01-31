json.array!(@orders) do |order|
  json.extract! order, :id, :Order, :total_cost, :quantity, :customer_id, :product_id
  json.url order_url(order, format: :json)
end
