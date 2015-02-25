# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  twitter_id :integer          not null
#  name       :string(255)      not null
#  image      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do

  factory :nekogeruge, class: User do
    twitter_id 301244995
    name "nekogeruge_987"
    image "http://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg"

    after :create do |u|
      create :chikoku, user_id: u.id
      create :gotanda, user_id: u.id
    end
  end

  factory :has_not_create_destination, class: User do
    twitter_id 301244995
    name "nekogeruge_987"
    image "http://pbs.twimg.com/profile_images/378800000057979446/39eb8dbe5c61459b6bc1377f54587c52_normal.jpeg"
  end

end
