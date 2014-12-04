class TripsController < ApplicationController


  # before_filter :logged_in

  def single

    trip = Trip.find_by(:key => params[:trip])

    set_meta_tags :title => trip.title

    @trip = trip.to_json
    if can_edit(trip)
      render "trips/edit"
    elsif can_view(trip)

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

  private
  def can_view(trip)

    if trip.visibility === "public" || trip.visibility === "shared"
      return true
    else
      return false
    end

  end

  def can_edit(trip)


    if trip.user_id === current_user.id
      return true
    else
      return false
    end

  end

end
