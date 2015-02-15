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

FactoryGirl.define do

  factory :chikoku, class: SlackNotification do
    request_url "https://hooks.slack.com/services/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"
    slack_name "yudai"
    emoji ":ghost:"
    message "遅刻連絡アプリのテスト"
  end

end
