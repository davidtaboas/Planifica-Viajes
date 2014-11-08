class TripsController < ApplicationController


  # before_filter :logged_in

  def single
    profile = User.find_for_authentication(:username => params[:username])
    trip = Trip.find(params[:trip])

    if can_edit(profile)
      @trip = trip.to_json
      render "trips/edit"
    elsif can_view(trip)
      @trip = trip.to_json
      # @budgets = trip.budgets
      # @places = trip.places
      # @items = trip.items
      render "trips/single"
    else
      authenticate_user!
    end

  end

  def create
    profile = User.find_by(:username => params[:username])
    trip = profile.trips.create()
    redirect_to "/u/#{profile.username}/#{trip.id}"
  end

  private
  def can_view(trip)

    if trip.visibility === "public" || (trip.visibility === "shared" && params[:key] === trip.key)
      return true
    else
      return false
    end

  end

  def can_edit(user)


    if user === current_user
      return true
    else
      return false
    end

  end

end
