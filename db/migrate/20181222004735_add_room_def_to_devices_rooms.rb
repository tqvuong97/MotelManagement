class AddRoomDefToDevicesRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices_rooms, :room, foreign_key: true
  end
end
