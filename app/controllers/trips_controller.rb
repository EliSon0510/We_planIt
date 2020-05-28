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

  def search
    if params[:query].present?
      sql_query = "start_date ILIKE :query OR end_date ILIKE :query OR budget ILIKE :query OR destination ILIKE :query"
      @trips = Trip.where(sql_query, query: "%#{params[:query]}%")
    else
      @trips = Trip.all
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
    @trip.user = current_user
    authorize @trip
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
    authorize @trip
  end
end
