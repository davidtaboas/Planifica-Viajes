class ProfilesController < ApplicationController
  # before_action :authenticate_user!

  def single

    profile = User.find_for_authentication(:username => params[:username])

    set_meta_tags :title =>  profile.username
    @profile = profile
    @trips = profile.trips

  end

  def delete

    @user = User.find_by(:username => params[:username])
    if current_user  === @user
      sign_out current_user
      @user.destroy
    end

    redirect_to "/", notice: t("AccountDeleted")

  end
end
