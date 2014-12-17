class Api::ItemsController < ApplicationController

  def index

    trip = Trip.find(params[:trip_id])

    if params[:type] == "stuffs"
      cat   = "material"
    elsif params[:type] == "tasks"
      cat = "todo"
    end


    items = trip.items.where(:cat => "#{cat}").order("created_at ASC")


     render json: items.to_json
  end


  def create

    trip = Trip.find(params[:trip_id])

    description = request["description"]


    if is_link(description)
      require 'pismo'
      doc = Pismo::Document.new(description)
      finalDescription = "<a href='#{description}'><span class='glyphicon glyphicon-link'></span> #{doc.title}</a>"
    else
      finalDescription = description
    end

    if params[:type] == "stuff"
      cat = "material"
    elsif params[:type] == "task"
      cat = "todo"
    end


    stuff = trip.items.create(description: finalDescription, status: false, cat: cat,date: Time.now)
    head :ok


  end

  def update

    trip = Trip.find(params[:trip_id])

    description = request["description"]


    if is_link(description)
      require 'pismo'
      doc = Pismo::Document.new(description)
      finalDescription = "<a href='#{description}'><span class='glyphicon glyphicon-link'></span> #{doc.title}</a>"
    else
      finalDescription = description
    end


    item = Item.find(params[:id])
    item.status = params[:status]
    item.description = finalDescription
    item.save!
    head :ok


  end

  def new

  end

  def edit

  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    head :ok
  end

  private

  def is_link(link)
    if /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix.match(link)
      return true
    else
      return false
    end
  end

end
