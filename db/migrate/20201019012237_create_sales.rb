class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.boolean :sold
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
