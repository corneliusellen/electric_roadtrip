class RouteController < ApplicationController

  def new
  end

  def show
    @linesting = GeocodeService.new.get_linestring(params[:start_address], params[:end_address])
    @stations = NrelService.new(linestring, params[:radius])
  end
end
