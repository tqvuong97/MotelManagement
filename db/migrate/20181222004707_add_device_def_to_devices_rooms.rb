class AddDeviceDefToDevicesRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :devices_rooms, :device, foreign_key: true
  end
end
