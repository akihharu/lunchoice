class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :cuisine
      t.string :main_dish

      t.timestamps
    end
  end
end
