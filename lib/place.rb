class Place
  attr_reader :name, :lat, :long, :lived

  GEOCODE_API_URL = "http://maps.googleapis.com/maps/api/geocode/json?sensor=false"

  def initialize(attributes)
    @name = attributes["name"]
    @lat = attributes["lat"]
    @long = attributes["long"]
    @lived = !!attributes["lived"]
  end

  def color
    lived ? "red" : "blue"
  end

  def z_index
    lived ? 1 : 0
  end

  def set_lat_long
    url = GEOCODE_API_URL + "&address=#{URI.escape name}"
    response = RestClient.get url
    json = JSON.parse response
    if result = json['results'].first
      @lat = result["geometry"]["location"]["lat"]
      @long = result["geometry"]["location"]["lng"]
    end
  end
end
