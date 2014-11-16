class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :medicine_id
      t.date :purchase_date
      t.integer :purchase_qty
      t.text :purchase_details
      t.float :purchase_price
      t.date :expiry
      t.integer :present_stock

      t.timestamps
    end
  end
end
