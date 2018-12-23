class AddRoomDefToServicesRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :services_rooms, :room, foreign_key: true
  end
end
