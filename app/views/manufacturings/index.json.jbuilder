json.array!(@manufacturings) do |manufacturing|
  json.extract! manufacturing, :id
  json.url manufacturing_url(manufacturing, format: :json)
end
