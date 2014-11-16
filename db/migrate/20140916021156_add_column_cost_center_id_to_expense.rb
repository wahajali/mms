class AddColumnCostCenterIdToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :cost_centerable_id, :integer
    add_column :expenses, :cost_centerable_type, :string
  end
end
