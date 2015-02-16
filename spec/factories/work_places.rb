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

FactoryGirl.define do

  factory :gotanda, class: WorkPlace do
    destination "五反田駅"
    limit "9:00"
  end

end
