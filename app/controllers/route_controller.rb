class RouteController < ApplicationController

  def new
  end

  def show
    linestring = GeocodeService.new.get_linestring(params[:start_address], params[:end_address])
    stations = NrelService.new(linestring, params[:radius]).get_stations
    @stations = transform(stations).to_json.html_safe
    @route = GeocodeService.new.get_route
  end

  def transform(stations)
    stations.map do |station|
      {
        "type": "Feature",
        "geometry": {
          "type": "Point",
          "coordinates": station
          },
        "properties": {
          "icon": "monument"
          }
        }
    end
  end
end
