class MessengersController < ApplicationController
  before_action :authenticated

  def check
    time_limit = TimeLimit.new(current_user, messenger_params[:lat], messenger_params[:lng])

    if time_limit.over?
      render json: { time_over: true }, status: 200
    else
      render json: { time_over: false }, status: 200
    end
  end

  def slack
    Messenger.new(current_user, SlackNotification).send_message
    render nothing: true, status: 200
  end

  private

  def messenger_params 
    params.require(:messenger).permit(:lat, :lng)
  end
end
