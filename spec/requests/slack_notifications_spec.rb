require 'rails_helper'

RSpec.describe "SlackNotifications", type: :request do
  describe "GET /slack_notifications" do
    xit "works! (now write some real specs)" do
      get slack_notifications_path
      expect(response).to have_http_status(200)
    end
  end
end
