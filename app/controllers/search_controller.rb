class SearchController < ApplicationController

  def new
  end

  def index
    result = GeocodeService.new(params[:address])
    result.geocode
    @lat = result.lat
    @long = result.long
    @vehicle = Vehicle.find_by(record_id: params[:vehicle_id])
    @image = VehicleImageSearch.new(@vehicle).find_image
  end
end
