class Vehicle
  attr_reader :make,
              :model,
              :year,
              :fuel_type,
              :range,
              :mpge

  def initialize(vehicle_info)
    @make = vehicle_info["make"]
    @model = vehicle_info["model"]
    @year = vehicle_info["year"]
    @fuel_type = vehicle_info["fuelType"]
    @range = vehicle_info["rangeA"]
    @mpge = vehicle_info["combA08"]
    @charge120 = vehicle_info["charge120"]
    @charge240 = vehicle_info["charge240"]
  end

  def charge_120
    if charge120 == "0.0"
      "n/a"
    else
      "#{charge120} hours"
    end
  end

  def charge_240
    if charge240 == "0.0"
      "n/a"
    else
      "#{charge240} hours"
    end
  end

  private

  attr_reader :charge120,
              :charge240
end
