class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def show


    profile = User.find_for_authentication(:username => params[:id])

    set_meta_tags :title =>  profile.username
    @profile = profile
    @trips = profile.trips
    @favorites = profile.trips_marked_as :favorite
    @editables = Trip.with_role(:editor, profile)

  end

  def destroy

    require "awesome_print"

    ap params
    @user = User.find_by(:username => params[:id])
    if current_user  === @user
      sign_out current_user
      @user.destroy
    end

    redirect_to "/", notice: t("user.accountDeleted")

  end
end
