class CreateCorporates < ActiveRecord::Migration
  def change
    create_table :corporates do |t|
      t.timestamps
    end
  end
end
