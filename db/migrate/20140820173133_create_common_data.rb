class CreateCommonData < ActiveRecord::Migration
  def change
    create_table :common_data do |t|
      t.string :name
      t.string :contact_person
      t.string :legal_entity
      t.string :ownership
      t.float :assets_value
      t.text :facilities_details
      t.date :operating_since
      t.text :operating_business
      t.string :liabilities
      t.integer :manpower_strength
      t.text :manpower_details
      t.integer :center_type_id
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
