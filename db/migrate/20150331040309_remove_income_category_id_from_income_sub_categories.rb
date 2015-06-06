class RemoveIncomeCategoryIdFromIncomeSubCategories < ActiveRecord::Migration
  def change
    remove_column :income_sub_categories, :income_category_id
  end
end
