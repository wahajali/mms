class AddColumnLandlineToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :landline, :text
  end
end
