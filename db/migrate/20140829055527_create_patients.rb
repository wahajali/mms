class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :card_no
      t.date :card_date
      t.string :first_name
      t.string :last_name
      t.string :fathers_name
      t.string :mothers_name
      t.string :husbands_name
      t.date :dob
      t.string :referred_by
      t.string :gender
      t.string :marital_status
      t.string :blood_group
      t.string :patient_type
      t.string :financial_type
      t.string :treatment_type

      t.timestamps
    end
  end
end
