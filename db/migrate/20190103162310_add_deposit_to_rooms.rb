class AddDepositToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :deposit, :integer
  end
end
