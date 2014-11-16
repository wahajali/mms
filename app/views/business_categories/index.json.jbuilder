json.array!(@business_categories) do |business_category|
  json.extract! business_category, :id, :name, :business_centerable_type, :business_centerable_id
  json.url business_category_url(business_category, format: :json)
end
