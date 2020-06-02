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
    @notifications = Notification.where(recipient: current_user, actor: actor(@interaction)).unread
    @notifications.each do |notification|
      notification.read_at = Time.now
      notification.save
    end
    notifications
  end

  def destroy
    @interaction = Interaction.find(params[:id])
    authorize @interaction
    @interaction.destroy
    redirect_to dashboard_path
  end

  private

  def actor(interaction)
    if current_user == interaction.trip.user
      interaction.user
    else
      interaction.trip.user
    end
  end

  def trip_params
    params.require(:interaction).permit(:status)
  end
end
