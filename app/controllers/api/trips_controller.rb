class Api::TripsController < ApplicationController

  def show

    trip = Trip.find(params[:id])
    render json: trip
  end

  def index

  end

  def create

  end

  def update
    trip = Trip.find(params[:id])


    if !request["description"].nil?
     trip.description = request["description"]
    end
    if !request["visibility"].nil?
     trip.visibility = request["visibility"]
    end

    if !request["title"].nil?
     trip.title = request["title"]
    end

    if request["startDate"].presence
     trip.startDate = request["startDate"]
    end

    if request["endDate"].presence
     trip.endDate = request["endDate"]
    end

    if !request["fav"].nil?
     ap request["fav"]
     if trip.marked_as? :favorite, :by => current_user
       trip.unmark :favorite, :by => current_user
     else
       current_user.mark_as_favorite trip
     end
    end
    trip.save!
    head :ok
  end

  def destroy

  end

end
