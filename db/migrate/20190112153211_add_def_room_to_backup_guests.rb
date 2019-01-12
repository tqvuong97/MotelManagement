class AddDefRoomToBackupGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :backup_guests, :room, foreign_key: true
  end
end
