class SlackNotificationsController < ApplicationController
  before_action :authenticated
  before_action :set_slack_notification, only: [:edit, :update]

  # GET /slack/new
  def new
    @slack_notification = SlackNotification.new
  end

  # GET /slack/edit
  def edit
  end

  # POST /slack
  def create
    @slack_notification = SlackNotification.new(new_spack_notification)

    respond_to do |format|
      if @slack_notification.save
        format.html { redirect_to root_path, notice: 'Slack notification was successfully created.' }
        format.json { render json: @slack_notification, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @slack_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT PATCH /slack
  def update
    respond_to do |format|
      if @slack_notification.update(slack_notification_params)
        format.html { redirect_to root_path, notice: 'Slack notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slack_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_slack_notification
    @slack_notification = SlackNotification.find_by(user_id: current_user.id)
  end

  def slack_notification_params
    params.require(:slack_notification).permit(:user_id, :slack_name, :emoji, :request_url, :message)
  end

  def new_spack_notification
    slack_notification_params.merge({ user_id: current_user.id })
  end
end
