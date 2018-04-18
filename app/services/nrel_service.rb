require 'uri'
require 'net/http'

class NrelService
  def initialize(linestring, radius)
    @linestring = linestring
    @radius = radius
  end

  def get_stations
    url = URI("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearby-route.json?api_key=#{ENV["NREL_API_KEY"]}&distance=2&fuel_type=ELEC")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/x-www-form-urlencoded'
    @linestring.gsub!(" ","%20")
    @linestring.gsub!(",","%2C")
    @linestring.chomp!("%2C")
    request.body = "route=LINESTRING(#{@linestring})"

    response = http.request(request)
    raw = response.read_body
    stations = JSON.parse(raw)["fuel_stations"]
    get_lat_longs(stations)
  end

  def get_lat_longs(stations)
    stations.map do |station|
      [station["longitude"], station["latitude"]]
    end
  end
end
