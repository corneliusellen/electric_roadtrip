class Api::V1::MakesController < ActionController::API

  def index
    makes = VehicleSearch.new.get_makes(params[:year])
    render json: makes
  end
end
