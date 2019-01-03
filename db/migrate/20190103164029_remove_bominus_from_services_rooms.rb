class RemoveBominusFromServicesRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :services_rooms, :bominus, :integer
  end
end
