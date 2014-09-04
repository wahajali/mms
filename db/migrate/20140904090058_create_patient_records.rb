class CreatePatientRecords < ActiveRecord::Migration
  def change
    create_table :patient_records do |t|
      t.integer :patient_id
      t.date :visit_date_islamic
      t.date :visit_date_english
      t.string :visit_day
      t.integer :doctor_id
      t.string :handling_person
      t.float :checked_weight
      t.float :checked_height
      t.float :checked_bp
      t.integer :no_of_children
      t.integer :youngest_child_age
      t.string :lscs
      t.text :diabetic_history
      t.text :present_complaint
      t.text :conducted_physical_examination

      t.timestamps
    end
  end
end
