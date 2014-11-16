json.array!(@income_sub_categories) do |income_sub_category|
  json.extract! income_sub_category, :id, :name
  json.url income_sub_category_url(income_sub_category, format: :json)
end
