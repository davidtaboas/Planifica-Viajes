class TripsController < ApplicationController


  # before_filter :logged_in

  def single

    trip = Trip.find_by(:key => params[:trip])

    set_meta_tags :title => trip.title

    @trip = trip.to_json

    @favorite = trip.marked_as? :favorite, :by => current_user

    if can? :write, trip
      render "trips/edit"
    elsif can? :read, trip
      render "trips/single"
    else
      authenticate_user!
    end

  end

  def create
    profile = User.find_by(:username => params[:username])
    trip = profile.trips.create()
    # redirect_to "/u/#{profile.username}/#{trip.id}"
    redirect_to trip_url(trip.key)
  end


end
