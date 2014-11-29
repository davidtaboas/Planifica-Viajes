class ApiController < ApplicationController

  # before_action :authenticate_user!

  def getItems

    trip = Trip.find(params[:trip])


    items = trip.items

    if params[:type] == "stuffs"
      items   = items.select { |key| key["cat"] == "material" }
    elsif params[:type] == "tasks"
      items    = items.select { |key| key["cat"] == "todo" }
    end

     render json: items.to_json

  end

  def setItems

    trip = Trip.find(params[:trip])

    if params[:id].nil?
      if params[:type] == "stuff"
        cat = "material"
      elsif params[:type] == "task"
        cat = "todo"
      end

      stuff = trip.items.create(description: request["description"], status: false, cat: cat,date: Time.now)

      # render status: 200
      head :ok
    else

      item = Item.find(params[:id])
      item.status = params[:status]
      item.description = params[:description]
      item.save!
      head :ok

    end
  end

  def deleteItems
    item = Item.find(params[:item])
    item.destroy
    head :ok
  end


  def getBudgets

    trip = Trip.find(params[:trip])


    budgets = trip.budgets

     render json: budgets.to_json

  end

  def setBudgets

    trip = Trip.find(params[:trip])
    budget = trip.budgets.create()
    budget.units        = request["units"]
    budget.priceperunit = request["priceperunit"]
    budget.category     = request["category"]
    budget.date         =  Time.now
    budget.description  = request["description"]
    budget.save!
    # render status: 200
    head :ok

  end

  def modBudgets
    budget = Budget.find(params[:id])
    budget.units        = request["units"]
    budget.priceperunit = request["priceperunit"]
    budget.category     = request["category"]
    budget.date         = Time.now
    budget.description  = request["description"]
    budget.save!
    head :ok
  end

  def deleteBudgets
    budget = Budget.find(params[:item])
    budget.destroy
    head :ok
  end

  def getDest
    trip = Trip.find(params[:trip])
    places = trip.places
    render json: places.to_json
  end

  def setDest

    trip = Trip.find(params[:trip])
    trip.places = []
    request["dests"].each_with_index do |d, index|
      place = trip.places.create()
      place.name = d["name"]
      place.coordinates = d["coordinates"]
      place.order = index
      place.save!
    end

    head :ok

  end

  def createTrip
    profile = User.find_by(:username => params[:username])
    trip = profile.trips.create()
    render json: trip
  end

  def setDataTrip
    trip = Trip.find(params[:trip])

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
    trip.save!
    head :ok
  end

  def setImageTrip

    trip = Trip.find(params[:trip])
    trip.image = params[:file]
    trip.save!

    # head :ok
    render json: trip

  end

  def removeTrip
    trip = Trip.find(params[:trip])
    trip.destroy

    head :ok

  end


end
