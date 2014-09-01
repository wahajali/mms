json.array!(@tradings) do |trading|
  json.extract! trading, :id
  json.url trading_url(trading, format: :json)
end
