json.array!(@patient_records) do |patient_record|
  json.extract! patient_record, :id, :patient_id, :visit_date_islamic, :visit_date_english, :visit_day, :doctor_id, :handling_person, :checked_weight, :checked_height, :checked_bp, :no_of_children, :youngest_child_age, :lscs, :diabetic_history, :present_complaint, :conducted_physical_examination
  json.url patient_record_url(patient_record, format: :json)
end
