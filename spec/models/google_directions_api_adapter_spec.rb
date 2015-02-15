require 'rails_helper'

describe GoogleDirectionsApiAdapter do
  describe ".get_duration" do
    let(:origin) { "目白" }
    let(:destination) { "五反田" }

    subject { described_class.new(origin, destination).get_duration }
    it { should have_key "text" }
    it { should have_key "value" }
  end
end
