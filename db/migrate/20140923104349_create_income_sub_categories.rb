class CreateIncomeSubCategories < ActiveRecord::Migration
  def change
    create_table :income_sub_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
