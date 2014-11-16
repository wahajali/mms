class AddBalSheetOrPlToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :bal_sheet_or_pl, :string
  end
end
