class AddServicesRoomDefToBillings < ActiveRecord::Migration[5.2]
  def change
    add_reference :billings, :services_room, foreign_key: true
  end
end
