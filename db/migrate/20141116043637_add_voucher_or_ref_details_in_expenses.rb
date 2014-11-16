class AddVoucherOrRefDetailsInExpenses < ActiveRecord::Migration
  def change
    add_column :incomes, :voucher_or_ref_details, :string
    add_column :expenses, :voucher_or_ref_details, :string
    add_column :incomes, :unique_identifier, :string
    add_column :expenses, :unique_identifier, :string
  end
end
