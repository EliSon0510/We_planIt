class TripsController < ApplicationController
  before_action :set_trip, only:[:show, :edit, :destroy, :update]


  def index
      start_date >= params[:start_date]
      end_date <= params[:end_date]
    if params[:destination].present?
      sql_query_1 = "destination ILIKE :destination"
      @trips = policy_scope(Trip).where(sql_query_1, destination: "%#{params[:destination]}%")
    elsif params[:budget].present?
      sql_query_3 = "budget ILIKE :budget"
      @trips = policy_scope(Trip).where(sql_query_3, budget: "%#{params[:budget]}%")
    elsif params[:start_date].present? && params[:end_date].present?
      sql_query_2 = "start_date ILIKE :start_date AND end_date ILIKE :end_date"
      @trips = policy_scope(Trip).where(sql_query_2, start_date: "%#{params[:start_date]}%", end_date: "%#{params[:end_date]}%")
    elsif params[:budget].present? || params[:destination].present? || params[:start_date].present? && params[:end_date].present?
      sql_query_6 = "budget ILIKE :budget OR :destination ILIKE :destination OR start_date ILIKE :start_date AND end_date ILIKE :end_date"
      @trips = policy_scope(Trip).where(sql_query_6, budget: "%#{params[:budget]}%", destination: "%#{params[:destination]}%", start_date: "%#{params[:start_date]}%", end_date: "%#{params[:end_date]}%")
    elsif params[:destination].present? && params[:start_date].present? && params[:end_date].present?
      sql_query_5 = "destination ILIKE :destination AND start_date ILIKE :start_date AND end_date ILIKE :end_date"
      @trips = policy_scope(Trip).where(sql_query_5, destination: "%#{params[:destination]}%", start_date: "%#{params[:start_date]}%", end_date: "%#{params[:end_date]}%")
    elsif params[:destination].present? && params[:budget].present?
      sql_query_4 = "destination ILIKE :destination AND budget ILIKE :budget"
      @trips = policy_scope(Trip).where(sql_query_4, destination: "%#{params[:destination]}%", budget: "%#{params[:budget]}%")
    elsif params[:budget].present? && params[:start_date].present? && params[:end_date].present?
      sql_query_7 = "budget ILIKE :budget AND start_date ILIKE :start_date AND end_date ILIKE :end_date"
      @trips = policy_scope(Trip).where(sql_query_7, budget: "%#{params[:budget]}%", start_date: "%#{params[:start_date]}%", end_date: "%#{params[:end_date]}%")
    elsif params[:budget].present? && params[:start_date].present? && params[:end_date].present? && params[:destination].present?
      sql_query_8 = "budget ILIKE :budget AND start_date ILIKE :start_date AND end_date ILIKE :end_date AND destination ILIKE :destination"
      @trips = policy_scope(Trip).where(sql_query_8, budget: "%#{params[:budget]}%", start_date: "%#{params[:start_date]}%", end_date: "%#{params[:end_date]}%", destination: "%#{params[:destination]}%")
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
    params.require(:trip).permit(:destination, :start_date, :end_date, :budget, interest_ids: [])
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
