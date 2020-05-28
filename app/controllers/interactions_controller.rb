class InteractionsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @interaction = Interaction.new
    authorize @interaction
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @interaction = Interaction.new
    @interaction.trip = @trip
    @interaction.user = current_user
    authorize @interaction
    if @interaction.save
      redirect_to trip_interaction_path(@trip, @interaction)
    else
      redirect_to trip_path(@trip)
    end
  end

  #def update
    #@interaction = Interaction.find(params[:id])
    #status --> actif to pending
    #status --> pending to proved
    #status --> pending to refused
  #end

  def show
    @message = Message.new
    @interaction = Interaction.find(params[:id])
    authorize @interaction
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    authorize @interaction
    @interaction.destroy
    redirect_to trip_interaction_path
  end

  def trip_params
    params.require(:interaction).permit(:status)
  end
end
