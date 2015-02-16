class TimeLimit
  def initialize(user, lat, lng)
    @location = Geocoder.address("#{lat}, #{lng}")
    @user = user
  end

  #
  # 現在時刻 + 到着時間が今日のタイムリミットを過ぎてたらtrue
  #
  def over?
    (Time.now + duration) > @user.todays_time_limit
  end

  #
  # 到着地点までの所用時間(秒)
  #
  def duration
    obj = GoogleDirectionsApiAdapter.new(@location, @user.destination)
    obj.get_duration["value"].to_i
  end
end
