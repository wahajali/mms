class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :medicine_id
      t.integer :patient_record_id
      t.string :dosage
      t.text :notes

      t.timestamps
    end
  end
end
