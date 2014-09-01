json.array!(@patients) do |patient|
  json.extract! patient, :id, :card_no, :card_date, :first_name, :last_name, :fathers_name, :mothers_name, :husbands_name, :dob, :referred_by, :gender, :marital_status, :blood_group, :patient_type, :financial_type, :treatment_type
  json.url patient_url(patient, format: :json)
end
