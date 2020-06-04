class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    current_date = Time.now
    @interactions = Interaction.where(user: current_user)
    @trips = Trip.joins(:interactions).where(interactions: {user: current_user})

    @past_trips = @trips.select { |trip| trip.end_date < Date.today }
    @future_trips = @trips.select { |trip| trip.start_date >= Date.today }
    @my_trips = Trip.where(user: current_user)
  end

  def search
    @query = false
    if params[:destination].present?
      @query = true
      destination = params[:destination].gsub(/[^a-zA-Z ]/, "").gsub("  ", " ").gsub(/\s+/, ' ')
      sql_query_1 = "destination ILIKE :destination"
      @trips = @trips.search_by_destination(destination)
    end
  end

end
