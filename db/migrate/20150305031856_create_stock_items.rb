class CreateStockItems < ActiveRecord::Migration
  def change
    create_table :stock_items do |t|
      t.string :name
      t.string :manufacturer

      t.timestamps
    end
  end
end
