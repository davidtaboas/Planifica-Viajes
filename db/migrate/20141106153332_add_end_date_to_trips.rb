class AddEndDateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :endDate, :datetime
  end
end
