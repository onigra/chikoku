class SlackNotificationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :slack_name, :emoji, :request_url, :message
end
