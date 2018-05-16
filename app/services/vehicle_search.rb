class VehicleSearch
  def initialize(id=nil)
    @id = id.to_i
  end

  def get_years
    Vehicle.distinct.pluck(:year).sort.reverse
  end

  def get_makes(year)
    Vehicle.distinct.where(year: year).pluck(:make).sort
  end

  def get_models(year, make)
    Vehicle.distinct.where(year: year, make: make).pluck(:model).sort
  end

  def get_options(year, make, model)
    response = Faraday.get("https://www.fueleconomy.gov/ws/rest/vehicle/menu/options?model=#{model}&make=#{make}&year=#{year}")
    json = Hash.from_xml(response.body).to_json
    JSON.parse(json)["menuItems"]["menuItem"]
  end

  private

  attr_reader :id
end
