class MessagesController < ApplicationController

  def create
     @interaction = Interaction.find (params[:interaction_id])
     @message = Message.new(message_params)
     @message.interaction =  @interaction
     @message.user = current_user
     authorize @message
     if @message.save
      InteractionChannel.broadcast_to(
        @interaction,
        render_to_string(partial: 'message', locals:{message: @message})
      )
      redirect_to interaction_path(@interaction, anchor: "message-#{@message.id}")
    else
      render 'interactions/show'
    end
  end


  private

  def message_params
    params.require(:message).permit(:content)
  end

end
