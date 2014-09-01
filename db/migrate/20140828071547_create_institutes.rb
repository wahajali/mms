class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|

      t.timestamps
    end
  end
end
