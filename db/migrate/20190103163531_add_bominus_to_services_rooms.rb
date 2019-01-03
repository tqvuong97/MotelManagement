class AddBominusToServicesRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :services_rooms, :bominus, :integer
  end
end
