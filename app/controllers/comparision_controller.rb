class ComparisionController < ApplicationController

  def new
  end

  def show
    result = GeocodeService.new(params[:address])
    result.geocode
    @lat = result.lat
    @long = result.long
    vehicle_info_1 = VehicleSearch.new(params[:vehicle_id_1]).find_vehicle
    vehicle_info_2 = VehicleSearch.new(params[:vehicle_id_2]).find_vehicle
    @vehicle_1 = create_vehicle(vehicle_info_1)
    @vehicle_2 = create_vehicle(vehicle_info_2)
  end

  private

  def create_vehicle(vehicle_info)
    Vehicle.new(make: vehicle_info["make"], model: vehicle_info["model"], year: vehicle_info["year"], fuel_type: vehicle_info["fuelType"], range: vehicle_info["range"], mpge: vehicle_info["combA08"], charge120: vehicle_info["charge120"], charge240: vehicle_info["charge240"])
  end
end
