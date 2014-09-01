json.array!(@trusts) do |trust|
  json.extract! trust, :id
  json.url trust_url(trust, format: :json)
end
