class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.string :name
      t.string :business_centerable_type
      t.integer :business_centerable_id

      t.timestamps
    end
  end
end
