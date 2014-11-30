class ChangeColumnToText < ActiveRecord::Migration
  def change
    add_column :patients, :family_history_description, :text
    add_column :patients, :additional_notes, :text
    remove_column :patient_records, :family_history_description, :text
    remove_column :patient_records, :additional_notes, :text
  end
end
