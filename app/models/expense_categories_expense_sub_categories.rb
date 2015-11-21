# == Schema Information
#
# Table name: expense_categories_expense_sub_categories
#
#  id                      :integer          not null, primary key
#  expense_category_id     :integer
#  expense_sub_category_id :integer
#  created_at              :datetime
#  updated_at              :datetime
#

class ExpenseCategoriesExpenseSubCategories < ActiveRecord::Base
  belongs_to :expense_category
  belongs_to :expense_sub_category
end
