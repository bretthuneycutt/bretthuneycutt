class Place
  attr_reader :name, :lat, :long

  def initialize(attributes)
    @name = attributes["name"]
    @lat = attributes["lat"]
    @long = attributes["long"]
  end

  def color
    "green"
  end

end
