json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :qualification, :notes
  json.url doctor_url(doctor, format: :json)
end
