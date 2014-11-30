class AppColumnBsOrPlSubCategoryIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :bs_or_pl_sub_category_id, :integer
    add_column :incomes, :bs_or_pl_sub_category_id, :integer
  end
end
