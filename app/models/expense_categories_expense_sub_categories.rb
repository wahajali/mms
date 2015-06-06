class ExpenseCategoriesExpenseSubCategories < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :expense_sub_category
end
