class CreatePreviousIllnesses < ActiveRecord::Migration
  def change
    create_table :previous_illnesses do |t|
      t.integer :disease_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
