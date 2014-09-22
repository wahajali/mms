class CreateFamilyHistories < ActiveRecord::Migration
  def change
    create_table :family_histories do |t|
      t.integer :disease_id
      t.integer :patient_id
      t.string :relation

      t.timestamps
    end
  end
end
