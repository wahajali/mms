class AddColumnExpenseSubCategoryIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :expense_sub_category_id, :integer
  end
end
