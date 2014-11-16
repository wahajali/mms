json.array!(@income_types) do |income_type|
  json.extract! income_type, :id, :name
  json.url income_type_url(income_type, format: :json)
end
