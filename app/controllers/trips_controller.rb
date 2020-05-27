class TripsController < ApplicationController
  before_action :set_trip, only:[:show, :edit, :destroy, :update]


  def index
    @trips = Trip.all
  end

  def show
    @interaction = Interaction.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date, :budget, :interests)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
