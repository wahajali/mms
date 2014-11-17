class CreateBsOrPlSubCategories < ActiveRecord::Migration
  def change
    create_table :bs_or_pl_sub_categories do |t|
      t.string :name
      t.integer :bs_or_pl_category_id

      t.timestamps
    end
  end
end
