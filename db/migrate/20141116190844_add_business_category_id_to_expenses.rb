class AddBusinessCategoryIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :business_category_id, :integer
    add_column :incomes, :business_category_id, :integer
  end
end
