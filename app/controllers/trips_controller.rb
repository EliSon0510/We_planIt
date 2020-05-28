class TripsController < ApplicationController
  before_action :set_trip, only:[:show, :edit, :destroy, :update]


  def index
    #@trips = Trip.all
    @trips = policy_scope(Trip).order(created_at: :desc)

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
    params.require(:trip).permit(:destination, :start_date, :end_date, :budget)
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
