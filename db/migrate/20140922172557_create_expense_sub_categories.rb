class CreateExpenseSubCategories < ActiveRecord::Migration
  def change
    create_table :expense_sub_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
