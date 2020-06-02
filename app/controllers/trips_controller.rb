class TripsController < ApplicationController
  before_action :set_trip, only:[:show, :edit, :destroy, :update]


  def index
     @trips = Trip.order(created_at: :desc)
     @query = false
    if params[:destination].present?
      @query = true
      sql_query_1 = "destination ILIKE :destination"
      @trips = @trips.where(sql_query_1, destination: "%#{params[:destination]}%")
    end
    if params[:budget].present?
      @query = true
      budget_range = params[:budget].split("-")
      if budget_range.size == 1
        sql_query_3 = "budget > 1000"
       @trips = @trips.where(sql_query_3)
      else
        sql_query_3 = "budget > :low_range AND budget < :higher_range"
        @trips = @trips.where(sql_query_3, low_range: budget_range.first.to_i, higher_range: budget_range.last.to_i)
      end
    end
    if params["start date"].present? && params["end date"].present?
      @query = true
      start_date = Date.civil(params["start date"][:"start_date(1i)"].to_i,params["start date"][:"start_date(2i)"].to_i,params["start date"][:"start_date(3i)"].to_i)
      end_date = Date.civil(params["end date"][:"end_date(1i)"].to_i,params["end date"][:"end_date(2i)"].to_i,params["end date"][:"end_date(3i)"].to_i)
      sql_query_2 = "start_date >= :start_date AND end_date <= :end_date"
      @trips = @trips.where(sql_query_2, start_date: start_date, end_date: end_date )
   end
   if params[:name].present?
    @query = true
    sql_query_4 = "interests.name ILIKE :name"
    @trips = @trips.joins(:interests).where(sql_query_4, name: "%#{params[:name]}%")
  end

    @trips = policy_scope(@trips)

    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { trip: trip })
      }
    end
  end

  def show


    @markers = [
      {
        lat: @trip.latitude,
        lng: @trip.longitude
      }
      ]
    @interaction = Interaction.new
    @trip_interaction = Interaction.where(user: current_user, trip: @trip)

  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip
    if @trip.save!
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
    params.require(:trip).permit(:destination, :start_date, :end_date, :budget, :photo, interest_ids: [])
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
