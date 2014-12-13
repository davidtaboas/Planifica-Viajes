class Api::ImagesController < ApplicationController

  def create

    trip = Trip.find(params[:trip_id])
    trip.image = params[:file]
    trip.save!

    # head :ok
    render json: trip
  end

end
