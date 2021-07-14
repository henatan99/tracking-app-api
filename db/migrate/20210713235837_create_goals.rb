class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.float :quantity
      t.date :day_one
      t.date :day_last
      t.references :user, null: false, foreign_key: true
      t.references :measurement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
