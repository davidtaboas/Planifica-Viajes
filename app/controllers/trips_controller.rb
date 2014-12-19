class TripsController < ApplicationController

  before_filter :set_trip, only: [:show, :edit]
  # before_filter :logged_in

  def set_trip
    @trip = Trip.find_by(:key => params[:id])

    set_meta_tags :title => @trip.title
    set_meta_tags :og => {
      :title    => @trip.title,
      :type     => 'article',
      :url      => "#{trip_url(@trip.key)}",
      :image    => @trip.image.url
    }
    @favorite = @trip.marked_as? :favorite, :by => current_user
  end


  def show

    if can? :write, @trip
      redirect_to edit_trip_path(@trip.key)
    elsif cannot? :read, @trip

      if user_signed_in?
        authorize! :read, @trip
      else
        authenticate_user!
      end

    end

  end

  def edit

    if cannot? :write, @trip
      # como no puedo escribir, compruebo si estoy identificado
      if user_signed_in?
        # si estoy logueado pido autorización para editar
        authorize! :write, @trip
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
