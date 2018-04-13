class Api::V1::YearsController < ActionController::API

  def index
    years = VehicleSearch.new.get_years
    render json: years
  end
end
