class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.string :progressable_type
      t.integer :progressable_id
      t.integer :percentage
      t.date :progress_date

      t.timestamps
    end
  end
end
