class AddColumnMedicationTypeToMedicine < ActiveRecord::Migration
  def change
    add_column :medicines, :medication_type, :string
  end
end
