class AddColumnMobileNumberToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :mobile_number, :string
  end
end
