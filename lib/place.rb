class Place
  attr_reader :name, :lat, :long, :lived

  def initialize(attributes)
    @name = attributes["name"]
    @lat = attributes["lat"]
    @long = attributes["long"]
    @lived = !!attributes["lived"]
  end

  def color
    lived ? "red" : "blue"
  end
end
