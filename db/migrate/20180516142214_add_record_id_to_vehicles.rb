class AddRecordIdToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :record_id, :integer
  end
end
