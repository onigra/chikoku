# == Schema Information
#
# Table name: slack_notifications
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  slack_name  :string(255)
#  emoji       :string(255)
#  request_url :string(255)      not null
#  message     :text(65535)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SlackNotification < ActiveRecord::Base
  belongs_to :user

  def send_message
    HTTParty.post(
      request_url,
      body: {
        payload: {
          text:       message,
          username:   slack_name,
          icon_emoji: emoji
        }.to_json
      }
    )
  end
end
