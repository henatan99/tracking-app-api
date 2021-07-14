class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :name
      t.string :unit
      t.string :icon

      t.timestamps
    end
  end
end
