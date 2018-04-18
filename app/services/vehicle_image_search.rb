class VehicleImageSearch
  def initialize(vehicle)
    @vehicle = vehicle
  end

  def find_image
    response = Faraday.get("http://www.carimagery.com/api.asmx/GetImageUrl?searchTerm=#{@vehicle.make}+#{@vehicle.model}")
    json = Hash.from_xml(response.body).to_json
    JSON.parse(json)["string"]
  end
end
