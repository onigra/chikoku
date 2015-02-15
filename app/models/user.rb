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
end
