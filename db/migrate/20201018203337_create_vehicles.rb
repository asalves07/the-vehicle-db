class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :color
      t.string :transmission
      t.string :drive_type
      t.string :fuel_type
      t.string :car_type
      t.integer :door
      t.integer :engine
      t.integer :year
      t.integer :kilometrage
      t.string :plate
      t.references :car_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
