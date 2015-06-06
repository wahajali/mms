class CreateExpenseCategoriesExpenseSubCategories < ActiveRecord::Migration
  def change
    create_table :expense_categories_expense_sub_categories do |t|
      t.integer :expense_category_id
      t.integer :expense_sub_category_id

      t.timestamps
    end
  end
end
