class CreateMedicineTypes < ActiveRecord::Migration
  def change
    create_table :medicine_types do |t|
      t.string :medicine_type

      t.timestamps
    end
  end
end
