# == Schema Information
#
# Table name: work_places
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  destination :string(255)      not null
#  hour        :integer          not null
#  min         :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe WorkPlace do
  describe "#todays_time_limit" do
    let(:user) { FG.create :nekogeruge }
    let(:now) { Time.now }

    subject { user.work_place.todays_time_limit }

    it "当日のタイムリミットの時間を指したTimeオブジェクトが取得できる" do
      should eq Time.new(now.year, now.month, now.day, user.work_place.hour, user.work_place.min, 0)
    end
  end
end
