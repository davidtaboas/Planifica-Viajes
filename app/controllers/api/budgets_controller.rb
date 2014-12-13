class Api::BudgetsController < ApplicationController


  def index
    trip = Trip.find(params[:trip_id])
    budgets = trip.budgets
    render json: budgets.to_json
  end


  def create
    trip = Trip.find(params[:trip_id])
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


  def update
    budget = Budget.find(params[:id])
    budget.units        = request["units"]
    budget.priceperunit = request["priceperunit"]
    budget.category     = request["category"]
    budget.date         = Time.now
    budget.description  = request["description"]
    budget.save!
    head :ok
  end

  def destroy
    budget = Budget.find(params[:id])
    budget.destroy
    head :ok
  end


end
