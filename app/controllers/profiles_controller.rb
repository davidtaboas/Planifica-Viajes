class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def single

    profile = User.find_for_authentication(:username => params[:username])

    @profile = profile
    require "awesome_print"

    ap current_user
    @trips = profile.trips

  end

  def delete

    @user = User.find_by(:username => params[:username])
    if current_user  === @user
      sign_out current_user
      require "awesome_print"
      ap @user
      @user.destroy
    end

    redirect_to "/", notice: t("AccountDeleted")

  end
end
