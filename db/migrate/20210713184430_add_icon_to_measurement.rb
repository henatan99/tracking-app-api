class AddIconToMeasurement < ActiveRecord::Migration[6.1]
  def change
    add_column :measurements, :icon, :string
  end
end
