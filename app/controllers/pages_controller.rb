class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    current_date = Time.now
    trips = Trip.where(user: current_user)
    @past_trips = trips.select { |trip| trip.end_date < Date.today }
    @future_trips = trips.select { |trip| trip.start_date >= Date.today }
  end
end
