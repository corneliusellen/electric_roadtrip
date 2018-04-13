class VehicleSearch
  def initialize(id=nil)
    @id = id.to_i
  end

  def find_vehicle
      response = Faraday.get("https://www.fueleconomy.gov/ws/rest/vehicle/#{id}")
      json = Hash.from_xml(response.body).to_json
      JSON.parse(json)["vehicle"]
  end

  def get_years
    response = Faraday.get("https://www.fueleconomy.gov/ws/rest/vehicle/menu/year")
    json = Hash.from_xml(response.body).to_json
    JSON.parse(json)["menuItems"]["menuItem"]
  end

  def get_makes(year)
    response = Faraday.get("https://www.fueleconomy.gov/ws/rest/vehicle/menu/make?year=#{year}")
    json = Hash.from_xml(response.body).to_json
    JSON.parse(json)["menuItems"]["menuItem"]
  end

  def get_models(year, make)
    response = Faraday.get("https://www.fueleconomy.gov/ws/rest/vehicle/menu/model?year=#{year}&make=#{make}")
    json = Hash.from_xml(response.body).to_json
    JSON.parse(json)["menuItems"]["menuItem"]
  end

  private

  attr_reader :id
end
