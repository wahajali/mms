class LegacyAppointmentCards < ActiveRecord::Migration
  def change
    create_table :legacy_cards do |t|
      t.integer :patient_id

      t.timestamps
    end
  end
end
