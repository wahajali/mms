class AddColumnsToPatientRecords < ActiveRecord::Migration
  def change
    add_column :patient_records, :cost_centerable_type, :string
    add_column :patient_records, :cost_centerable_id, :integer
  end
end
