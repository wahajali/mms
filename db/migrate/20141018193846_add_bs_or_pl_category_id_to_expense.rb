class AddBsOrPlCategoryIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :bs_or_pl_category_id, :integer
    add_column :incomes, :bs_or_pl_category_id, :integer
  end
end
