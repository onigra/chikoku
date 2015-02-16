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

require 'rails_helper'

describe SlackNotification do
  describe "#send_message" do
    let(:user) { FactoryGirl.create :nekogeruge }
    subject { user.slack_notification.send_message }
    it { expect(subject.response.body).to eq "ok" }
  end
end
