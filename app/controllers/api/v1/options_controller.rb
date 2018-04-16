class Api::V1::OptionsController < ActionController::API

  def index
    options = VehicleSearch.new.get_options(params[:year], params[:make], params[:model])
    render json: [options]
  end
end
