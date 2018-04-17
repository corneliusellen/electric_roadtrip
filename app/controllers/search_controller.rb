class SearchController < ApplicationController

  def new
  end

  def index
    result = GeocodeService.new(params[:address])
    result.geocode
    @lat = result.lat
    @long = result.long
    vehicle_info = VehicleSearch.new(params[:vehicle_id]).find_vehicle
    @vehicle = create_vehicle(vehicle_info)
  end

  private

  def create_vehicle(vehicle_info)
    Vehicle.new(make: vehicle_info["make"], model: vehicle_info["model"], year: vehicle_info["year"], fuel_type: vehicle_info["fuelType"], range: vehicle_info["rangeA"], mpge: vehicle_info["combA08"], charge120: vehicle_info["charge120"], charge240: vehicle_info["charge240"])
  end
end
