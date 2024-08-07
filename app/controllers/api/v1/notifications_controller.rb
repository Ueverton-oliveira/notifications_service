class Api::V1::NotificationsController < ApplicationController
  def create
    notification = Notification.new(notification_params)

    if notification.save
      render json: { message: 'Notification received' }, status: :ok
    else
      render json: { error: 'Failed to save notification' }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:message, :received_at, :task_details, :user_data)
  end
end
