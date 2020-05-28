require 'pry'
class TripsController < ApplicationController
  before_action :set_trip, only:[:show, :edit, :destroy, :update]


  def index
    if params[:destination].present?
      sql_query_1 = "destination ILIKE :destination"
      @trips = policy_scope(Trip).where(sql_query_1, destination: "%#{params[:destination]}%")
    else
      @trips = policy_scope(Trip).order(created_at: :desc)
    end

    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { trip: trip })
      }
    end
  end

  def show
    @interaction = Interaction.new
    @trip_interaction = Interaction.where(user: current_user, trip: @trip)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @interest = Interest.find(params[:trip][:interest_id])
    @trip.interest = @interest
    @trip.user = current_user
    authorize @trip
    if @trip.save
      redirect_to @trip
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to dashboard_path
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :end_date, :budget, :interest_id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
