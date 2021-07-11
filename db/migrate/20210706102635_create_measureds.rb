class CreateMeasureds < ActiveRecord::Migration[6.1]
  def change
    create_table :measureds do |t|
      t.float :value
      t.references :user, null: false, foreign_key: true
      t.references :measurement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
