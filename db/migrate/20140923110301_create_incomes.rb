class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date
      t.integer :income_category_id
      t.integer :income_sub_category_id
      t.integer :income_type_id
      t.string :benefactor
      t.float :amount
      t.integer :cost_centerable_id
      t.string :cost_centerable_type

      t.timestamps
    end
  end
end
