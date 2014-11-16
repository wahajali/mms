class CreateIncomeTypes < ActiveRecord::Migration
  def change
    create_table :income_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
