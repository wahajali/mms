class AddBalSheetOrPl < ActiveRecord::Migration
  def change
    add_column :expenses, :bal_sheet_or_pl, :string
  end
end
