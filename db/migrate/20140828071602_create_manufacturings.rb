class CreateManufacturings < ActiveRecord::Migration
  def change
    create_table :manufacturings do |t|

      t.timestamps
    end
  end
end
