class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :status
      t.integer :price
      t.integer :slot

      t.timestamps
    end
  end
end
