class AddDateToLegacyCards < ActiveRecord::Migration
  def change
    add_column :legacy_cards, :appointment_date, :date
  end
end
