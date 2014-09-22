class AddColumnDiseaseIdToPatientRecord < ActiveRecord::Migration
  def change
    add_column :patient_records, :disease_id, :integer
  end
end
