class AddColumnIncomeCategoryIdToIncomeSubCategories < ActiveRecord::Migration
  def change
    add_column :income_sub_categories, :income_category_id, :integer
  end
end
