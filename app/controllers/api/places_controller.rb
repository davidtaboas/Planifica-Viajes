class Api::PlacesController < ApplicationController

  def index

    trip = Trip.find(params[:trip_id])
    places = trip.places
    render json: places.to_json
  end

  def create
    trip = Trip.find(params[:trip_id])
    trip.places = []
    request["dests"].each_with_index do |d, index|
      place = trip.places.create()
      place.name = d["name"]
      place.coordinates = d["coordinates"]
      place.order = index
      place.save!
    end

    head :ok
  end
end
