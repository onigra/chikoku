#
# Powered By Google Directions Api
# https://developers.google.com/maps/documentation/directions/?hl=ja
#
class GoogleDirectionsApiAdapter
  include HTTParty
  base_uri "maps.googleapis.com"

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  #
  # 所要時間の取得
  #
  def get_duration
    self.class.get("/maps/api/directions/json", param)["routes"][0]["legs"][0]["duration"]
  end

  private

  #
  # 現状、日本国内はオプションで公共交通機関(transit)を
  # 指定してもデータを取得できないようなので、
  # デフォルトのdriveで取得している
  #
  def param
    {
      query: {
        origin:      @origin,
        destination: @destination,
        sensor:      false,
        region:      "ja"
      }
    }
  end
end
