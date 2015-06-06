class RemoveExpenseCategoryIdFromExpenseSubCategories < ActiveRecord::Migration
  def change
    remove_column :expense_sub_categories, :expense_category_id
  end
end
