class VehiclesController < ApplicationController

  def create
    vehicle = Vehicle.create(vehicle_params)
    vehicle.update(user_id: current_user.id)
    if vehicle.save
      flash[:notice] = "Vehicle saved"
      redirect_to dashboard_path
    else
      flash[:notice] = "Vehicle not saved. Please try again."
      redirect_to dashboard_path
    end
  end

  def destroy
    Vehicle.find(params[:id]).destroy
    redirect_to dashboard_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :fuel_type, :range, :mpge, :charge120, :charge240)
  end
end
