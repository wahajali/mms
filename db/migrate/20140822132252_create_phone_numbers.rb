class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :number
      t.string :number_type
      t.integer :phoneable_id
      t.string :phoneable_type

      t.timestamps
    end
  end
end
