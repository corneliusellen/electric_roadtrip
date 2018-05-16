class RouteController < ApplicationController
  def new
  end

  def show
    @vehicle = Vehicle.find_by(record_id: params[:vehicle_id])
    service = RouteService.new(params[:start_address], params[:end_address])
    linestring = service.get_linestring
    @route = service.get_route
    stations = NrelService.new(linestring, params[:radius]).get_stations
    @stations = Geojson.build_stations(stations).to_json.html_safe
  end
end
