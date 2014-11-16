json.array!(@expense_sub_categories) do |expense_sub_category|
  json.extract! expense_sub_category, :id, :name
  json.url expense_sub_category_url(expense_sub_category, format: :json)
end
