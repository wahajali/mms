class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :medicine_type_id
      t.string :purpose
      t.string :make
      t.string :manufacturer
      t.string :distributor
      t.string :approving_agency
      t.string :classification_type_1
      t.string :classification_type_2
      t.text :other_specifications
      t.string :form
      t.string :potency
      t.integer :first_packing_unit_qty
      t.integer :second_packing_unit_qty
      t.integer :third_packing_unit_qty
      t.text :storage_instructions
      t.integer :expiry_duration_months

      t.timestamps
    end
  end
end
