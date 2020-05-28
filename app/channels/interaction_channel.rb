class InteractionChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    interaction = Interaction.find(params[:id])
    stream_for interaction
  end

end
