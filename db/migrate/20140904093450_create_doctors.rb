class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :qualification
      t.text :notes

      t.timestamps
    end
  end
end
