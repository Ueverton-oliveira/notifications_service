class Api::V1::NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    notification = Notification.new(notification_params)
    if notification.save
      render json: { message: 'Notification received successfully' }, status: :ok
    else
      render json: { error: 'Failed to save notification' }, status: :unprocessable_entity
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:task_id, :task_title, :task_description, :user_id, :action)
  end
end
