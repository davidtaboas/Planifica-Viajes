class AddUniqueKeyTrip < ActiveRecord::Migration
  def change
    add_index :trips, :key, unique: true
  end
end
