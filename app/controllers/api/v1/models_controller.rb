class Api::V1::ModelsController < ActionController::API

  def index
    models = VehicleSearch.new.get_models(params[:year], params[:make])
    render json: models
  end
end
