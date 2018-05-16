class RemoveUserFromVehicle < ActiveRecord::Migration[5.1]
  def change
    remove_reference :vehicles, :user
  end
end
