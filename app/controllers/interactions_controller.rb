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

  def update
    @interaction = Interaction.find(params[:id])
    if params[:interaction][:status] == "asking for validation..."
      @interaction.status = "pending"
    elsif params[:interaction][:status] == "Validated"
      @interaction.status = "accepted"
    elsif params[:interaction][:status] == "Denied"
      @interaction.status = "rejected"
    end
    authorize @interaction
    if @interaction.save
      redirect_to dashboard_path
    else
      render :show
    end
  end

  def show
    @message = Message.new
    @interaction = Interaction.find(params[:id])
    authorize @interaction
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    authorize @interaction
    @interaction.destroy
    redirect_to dashboard_path
  end

  def trip_params
    params.require(:interaction).permit(:status)
  end
end
