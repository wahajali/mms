class CreateLaboratories < ActiveRecord::Migration
  def change
    create_table :laboratories do |t|

      t.timestamps
    end
  end
end
