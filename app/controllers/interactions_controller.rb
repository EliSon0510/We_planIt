class InteractionsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @interaction = Interaction.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @interaction = Interaction.new
    @interaction.trip = @trip
    @interaction.user = current_user
    if @interaction.save
      redirect_to trip_interaction_path(@interaction)
    else
      redirect_to trip_path(@trip)
    end
  end

  def show
    @interaction = Interaction.find(params[:id])
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    @interaction.destroy
    redirect_to trip_interaction_path
  end

  def trip_params
    params.require(:interaction).permit(:status)
  end
end
