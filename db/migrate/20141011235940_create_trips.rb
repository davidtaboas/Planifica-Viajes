class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.string :visibility
      t.references :user, index: true

      t.timestamps
    end
  end
end
