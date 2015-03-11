class AddColumnsToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :cost_centerable_id, :integer
    add_column :stocks, :cost_centerable_type, :string
    add_column :stocks, :business_category_id, :integer
  end
end
