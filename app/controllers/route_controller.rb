class RouteController < ApplicationController

  def new
  end

  def show
    linestring = GeocodeService.new.get_linestring(params[:start_address], params[:end_address])
    @stations = NrelService.new(linestring, params[:radius]).get_stations.to_h.to_json
    @route = GeocodeService.new.get_route
  end
end
