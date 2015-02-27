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

class User < ActiveRecord::Base
  has_one :slack_notification
  has_one :work_place

  def self.find_or_create(auth_hash)
    user = self.find_by(twitter_id: auth_hash["extra"]["raw_info"]["id"])

    unless user
      user = self.new(
        twitter_id: auth_hash["extra"]["raw_info"]["id"],
        name:       auth_hash["info"]["nickname"],
        image:      auth_hash["info"]["image"]
      )

      user.save
    end

    user
  end

  def todays_time_limit
    work_place.todays_time_limit
  end

  def destination
    work_place.destination
  end
end
