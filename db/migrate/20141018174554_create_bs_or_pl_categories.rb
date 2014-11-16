class CreateBsOrPlCategories < ActiveRecord::Migration
  def change
    create_table :bs_or_pl_categories do |t|
      t.string :name
      t.string :bl_or_pl

      t.timestamps
    end
  end
end
