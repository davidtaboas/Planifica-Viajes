class HomeController < ApplicationController

  def index

    if signed_in?
      redirect_to profile_path(current_user.username)
    end
  end

  def show
    render 'home/index'
  end
end
