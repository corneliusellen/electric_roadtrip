class RouteController < ApplicationController
  def new
  end

  def show
    service = RouteService.new(params[:start_address], params[:end_address])
    linestring = service.get_linestring
    stations = NrelService.new(linestring, params[:radius]).get_stations
    @route = service.get_route
    @stations = Geojson.build_stations(stations).to_json.html_safe
  end
end
