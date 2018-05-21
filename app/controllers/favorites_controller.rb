class FavoritesController < ApplicationController

  def create
    favorite = Favorite.new(user_id: current_user.id, vehicle_id: params[:vehicle])
    if favorite.save
      flash[:notice] = "Vehicle saved"
      redirect_to dashboard_path
    else
      flash[:notice] = "Vehicle not saved. Please try again."
      redirect_to dashboard_path
    end
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, vehicle_id: params[:id]).destroy
    redirect_to dashboard_path
  end
end
