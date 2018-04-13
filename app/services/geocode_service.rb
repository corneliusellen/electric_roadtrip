class GeocodeService
  attr_reader :lat, :long

  def initialize(address)
    @address = address
    @lat = nil
    @long = nil
  end

  def geocode
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{@address}&key=#{ENV['GOOGLE_GEOCODE_KEY']}")
    lat_long = JSON.parse(response.body)["results"].first["geometry"]["location"]
    @lat = lat_long["lat"]
    @long = lat_long["lng"]
  end

end
