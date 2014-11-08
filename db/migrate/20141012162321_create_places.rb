class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :coordinates
      t.text :description
      t.integer :order
      t.references :trip, index: true

      t.timestamps
    end
  end
end
