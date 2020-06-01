class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    p params[:id]
    stream_from "notification:notifications_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
