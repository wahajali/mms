class CreateTradings < ActiveRecord::Migration
  def change
    create_table :tradings do |t|

      t.timestamps
    end
  end
end
