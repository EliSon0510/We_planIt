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
      create_notification
      redirect_to interaction_path(@interaction, anchor: "message-#{@message.id}")
    else
      render 'interactions/show'
    end
  end


  private

  def recipient
    @interaction = Interaction.find(params[:interaction_id])
    if current_user == @interaction.trip.user
      @interaction.user
    else
      @interaction.trip.user
    end
  end

  def create_notification
      notification = Notification.create!(recipient: recipient, actor: @message.user,
        action: 'posted', notifiable: @message)
      body = "#{@message.user.nickname} has sent you a message!"
      innnerHTML =  render_to_string(partial: 'shared/notification_message', locals:{notification: notification, body: body})
      innnerHTML2 =  render_to_string(partial: 'shared/notification_dropdown', locals:{notification: notification})
      NotificationChannel.broadcast_to("notifications_#{recipient.id}", body: innnerHTML, body2: innnerHTML2)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
