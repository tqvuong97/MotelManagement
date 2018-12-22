class CreateDevicesRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :devices_rooms do |t|
      t.string :status
      t.integer :quantity
      t.date :datebegin

      t.timestamps
    end
  end
end
