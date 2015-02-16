# == Schema Information
#
# Table name: work_places
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  destination :string(255)      not null
#  limit       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe WorkPlace do
  describe "#todays_time_limit" do
    let(:user) { FG.create :nekogeruge }
    let(:now) { Time.now }
    let(:limit_hour) { user.work_place.limit.split(":")[0] }
    let(:limit_minutes) { user.work_place.limit.split(":")[1] }

    subject { user.work_place.todays_time_limit }

    it "当日のタイムリミットの時間を指したTimeオブジェクトが取得できる" do
      should eq Time.new(now.year, now.month, now.day, limit_hour, limit_minutes, 0)
    end
  end
end
