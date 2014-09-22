class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date
      t.integer :expense_category_id
      t.string :receipient
      t.integer :expense_type_id
      t.float :amount

      t.timestamps
    end
  end
end
