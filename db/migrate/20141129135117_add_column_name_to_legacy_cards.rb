class AddColumnNameToLegacyCards < ActiveRecord::Migration
  def change
    add_column :legacy_cards, :name, :string
  end
end
