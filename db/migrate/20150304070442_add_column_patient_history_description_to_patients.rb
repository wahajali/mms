class AddColumnPatientHistoryDescriptionToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :patient_history_description, :text
  end
end
