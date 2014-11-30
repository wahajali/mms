class AddAssociatedAndMainDiseasesTables < ActiveRecord::Migration
  def change
    create_table :diagnosed_main_diseases do |t|
      t.integer :disease_id
      t.integer :patient_id
      t.integer :progress

      t.timestamps
    end

    create_table :diagnosed_associated_diseases do |t|
      t.integer :disease_id
      t.integer :patient_id
      t.integer :progress

      t.timestamps
    end
  end
end
