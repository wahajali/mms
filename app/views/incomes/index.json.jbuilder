json.array!(@incomes) do |income|
  json.extract! income, :id, :date, :income_category_id, :income_sub_category_id, :income_type_id, :benefactor, :amount, :cost_centerable_id, :cost_centerable_type
  json.url income_url(income, format: :json)
end
