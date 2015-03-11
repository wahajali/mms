class AddColumnExpenseCategoryIdToExpenseSubCategories < ActiveRecord::Migration
  def change
    add_column :expense_sub_categories, :expense_category_id, :integer
  end
end
