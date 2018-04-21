class RouteService

  def initialize(start_address, end_address)
    @start_address = start_address
    @end_address = end_address
  end

  def get_linestring
    response = Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{@start_address}&destination=#{@end_address}&key=#{ENV['GOOGLE_DIRECTIONS_KEY']}")
    encoded_route = JSON.parse(response.body)["routes"].first["overview_polyline"]["points"]
    @decoded_route = decode_WKB(encoded_route)
    convert_to_string(@decoded_route)
  end

  def decode_WKB(encoded_route)
    GoogleMapsService::Polyline.decode(encoded_route)
  end

  def convert_to_string(array)
    array.map do |hash|
      hash.values.reverse.join(" ") + ","
    end.join(" ")
  end

  def get_route
    @decoded_route.map do |point|
      point.values.reverse
    end
  end
end
