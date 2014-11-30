class AddColumnAdditionalNotesToPatientRecords < ActiveRecord::Migration
  def change
    add_column :patient_records, :additional_notes, :text
    remove_column :patient_records, :disease_id, :integer
    add_column :progresses, :additional_note, :text
  end
end
