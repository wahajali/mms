json.array!(@addresses) do |address|
  json.extract! address, :id, :line1, :line2, :city, :zip_code, :contact_person, :contact_number
  json.url address_url(address, format: :json)
end
