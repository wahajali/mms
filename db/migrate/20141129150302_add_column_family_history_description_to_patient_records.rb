class AddColumnFamilyHistoryDescriptionToPatientRecords < ActiveRecord::Migration
  def change
    add_column :patient_records, :family_history_description, :text
    add_column :patient_records, :additional_notes, :text
    change_column :incomes, :voucher_or_ref_details, :text
    change_column :expenses, :voucher_or_ref_details, :text
  end
end
