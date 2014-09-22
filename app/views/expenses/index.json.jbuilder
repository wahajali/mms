json.array!(@expenses) do |expense|
  json.extract! expense, :id, :date, :expense_category_id, :receipient, :expense_type_id, :amount
  json.url expense_url(expense, format: :json)
end
