json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :name, :medicine_type, :purpose, :make, :manufacturer, :distributor, :approving_agency, :classification_type_1, :classification_type_2, :other_specifications, :form, :potency, :first_packing_unit_qty, :second_packing_unit_qty, :third_packing_unit_qty, :storage_instructions, :expiry_duration_months
  json.url medicine_url(medicine, format: :json)
end
