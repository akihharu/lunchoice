class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.string :cuisin_at_choice
      t.string :main_dish_at_choice

      t.timestamps
    end
  end
end
