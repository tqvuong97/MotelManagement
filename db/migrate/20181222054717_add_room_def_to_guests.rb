class AddRoomDefToGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :guests, :room, foreign_key: true
  end
end
