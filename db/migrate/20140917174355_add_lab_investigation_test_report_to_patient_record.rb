class AddLabInvestigationTestReportToPatientRecord < ActiveRecord::Migration
  def change
    add_column :patient_records, :investigation_and_report, :text
  end
end
