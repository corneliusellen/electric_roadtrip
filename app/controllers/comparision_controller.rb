class ComparisionController < ApplicationController

  def new
  end

  def show
    result = GeocodeService.new(params[:address])
    result.geocode
    @lat = result.lat
    @long = result.long
    @vehicle_1 = Vehicle.find_by(record_id: params[:vehicle_id_1])
    @vehicle_2 = Vehicle.find_by(record_id: params[:vehicle_id_2])
  end
end
