json.array!(@corporates) do |corporate|
  json.extract! corporate, :id, :address_id
  json.url corporate_url(corporate, format: :json)
end
