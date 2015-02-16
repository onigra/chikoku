require 'rails_helper'

describe Messenger do
  describe "#send_message" do
    context "Slack" do
      let(:user) { FactoryGirl.create :nekogeruge }
      subject { Messenger.new(user, SlackNotification).send_message }
      it { expect(subject.response.body).to eq "ok" }
    end
  end
end
