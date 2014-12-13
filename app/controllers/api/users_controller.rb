class Api::UsersController < ApplicationController

  def show
    search = params[:search]
    me = params[:id]

    trip = Trip.find(params[:trip_id])
    editors = User.with_role(:editor, trip).select(:id)

    users = User.select(:id,:username).where("username LIKE ? AND username != ? AND id NOT IN(?)", "%#{search}%", me, editors)

    render json: users
  end


  def index
    trip = Trip.find(params[:trip_id])
    editors = User.with_role(:editor, trip)
    render json: editors
  end

  def create
    trip = Trip.find(params[:trip_id])
    editor = User.find_by(:username => request[:neweditor])
    editor.add_role :editor, trip
    editors = User.with_role(:editor, trip)
    render json: editors
  end

  def destroy
    trip = Trip.find(params[:trip_id])
    editor = User.find(request[:id])
    editor.remove_role :editor, trip
    editors = User.with_role(:editor, trip)
    render json: editors
  end
end
