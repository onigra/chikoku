require 'rails_helper'

describe TimeLimit do
  describe "#over?" do
    context "目白 - 五反田間" do
      # 目白駅
      let(:lat) { "35.721194" }
      let(:lng) { "139.706583" }

      let(:user) { FG.create :nekogeruge }
      let(:time_limit) { TimeLimit.new(user, lat, lng) }

      context "AM8:00 まだ時間に余裕がある" do
        before do
          t = Time.now
          t = Time.new(t.year, t.month, t.day, 8, 0, 0)
          Timecop.freeze t
        end

        after do
          Timecop.return
        end

        subject { time_limit.over? }
        it { should be false }
      end

      context "AM10:00 遅刻確定" do
        before do
          t = Time.now
          t = Time.new(t.year, t.month, t.day, 10, 0, 0)
          Timecop.freeze t
        end

        after do
          Timecop.return
        end

        subject { time_limit.over? }
        it { should be true }
      end
    end
  end

  describe "#duration" do
    context "目白 - 五反田間" do
      # 目白駅
      let(:lat) { "35.721194" }
      let(:lng) { "139.706583" }

      let(:user) { FG.create :nekogeruge }
      let(:time_limit) { TimeLimit.new(user, lat, lng) }
      subject { time_limit.duration }

      it "移動時間は1599秒" do
        should eq 1599
      end
    end
  end
end
