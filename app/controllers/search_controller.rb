class SearchController < ApplicationController

  def new
  end

  def index
    result = GeocodeService.new(params[:address])
    result.geocode
    @lat = result.lat
    @long = result.long
    vehicle_info = VehicleSearch.new(params[:vehicle_id]).find_vehicle
    @vehicle = Vehicle.new(vehicle_info)
  end
end
