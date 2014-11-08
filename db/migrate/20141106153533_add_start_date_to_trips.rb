class AddStartDateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :startDate, :datetime
  end
end
