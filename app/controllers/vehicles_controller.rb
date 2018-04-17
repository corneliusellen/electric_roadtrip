class VehiclesController < ApplicationController

  def create
    vehicle = Vehicle.create(vehicle_params)
    vehicle.update(user_id: current_user.id)
    if vehicle.save
      redirect_to dashboard_path
    else
      render
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :fuel_type, :range, :mpge, :charge120, :charge240)
  end
end
