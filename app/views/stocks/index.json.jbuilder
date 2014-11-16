json.array!(@stocks) do |stock|
  json.extract! stock, :id, :medicine_id, :purchase_date, :purchase_qty, :purchase_details, :purchase_price, :expiry, :present_stock
  json.url stock_url(stock, format: :json)
end
