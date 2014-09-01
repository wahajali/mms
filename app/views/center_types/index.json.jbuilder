json.array!(@center_types) do |center_type|
  json.extract! center_type, :id, :name
  json.url center_type_url(center_type, format: :json)
end
