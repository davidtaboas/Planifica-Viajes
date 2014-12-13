class TripsController < ApplicationController


  # before_filter :logged_in

  def show

    trip = Trip.find_by(:key => params[:id])

    set_meta_tags :title => trip.title

    @trip = trip.to_json

    @favorite = trip.marked_as? :favorite, :by => current_user

    if can? :write, trip
      redirect_to edit_trip_path(trip.key)
    elsif cannot? :read, trip

      if user_signed_in?
        authorize! :read, trip
      else
        authenticate_user!
      end

    end

  end

  def edit

    trip = Trip.find_by(:key => params[:id])

    set_meta_tags :title => trip.title

    @trip = trip.to_json

    @favorite = trip.marked_as? :favorite, :by => current_user

    if cannot? :write, trip
      # como no puedo escribir, compruebo si estoy identificado
      if user_signed_in?
        # si estoy logueado pido autorización para editar
        authorize! :write, trip
      else
        # si no estoy identificado, lo tengo que estar!
        authenticate_user!
      end
    end


  end

  def new
    profile = User.find(params[:profile_id])
    trip = profile.trips.create()
    # redirect_to "/u/#{profile.username}/#{trip.id}"
    redirect_to trip_url(trip.key)
  end

  def destroy
    trip = Trip.find_by(:key => params[:id])
    trip.destroy

    redirect_to profile_path(current_user.username), :alert => "Viaje eliminado"

  end


end
