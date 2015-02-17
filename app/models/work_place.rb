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

class WorkPlace < ActiveRecord::Base
  belongs_to :user

  def todays_time_limit
    t = Time.now
    Time.new(t.year, t.month, t.day, hour, min, 0)
  end
end
