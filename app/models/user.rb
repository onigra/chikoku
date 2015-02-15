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

  def self.find_or_create_from_auth_hash(auth_hash)
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
end
