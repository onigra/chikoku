class MessengersController < ApplicationController
  before_action :authenticated

  def slack
    Messenger.new(current_user, SlackNotification).send_message
    redirect_to '/'
    # time_limit = TimeLimit.new(current_user, messenger_params[:lat], messenger_params[:lng])

    # if time_limit.over?
    #   Messenger.new(current_user, SlackNotification).send_message
    # end
  end

  private

  def messenger_params 
    params.require(:messenger).permit(:lat, :lng)
  end
end
