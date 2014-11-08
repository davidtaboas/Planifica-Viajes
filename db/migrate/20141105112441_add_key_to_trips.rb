class AddKeyToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :key, :string
  end
end
