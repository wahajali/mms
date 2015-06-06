class CreateIncomeCategoriesIncomeSubCategories < ActiveRecord::Migration
  def change
    create_table :income_categories_income_sub_categories do |t|
      t.integer :income_category_id
      t.integer :income_sub_category_id

      t.timestamps
    end
  end
end
