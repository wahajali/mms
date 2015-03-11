json.array!(@stock_items) do |stock_item|
  json.extract! stock_item, :id, :name, :manufacturer, :cost_centerable_id, :cost_centerable_type
  json.url stock_item_url(stock_item, format: :json)
end
