class CreateServicesRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :services_rooms do |t|
      t.date :datebegin
      t.date :dateend
      t.integer :electbegin
      t.integer :electend
      t.integer :waterbegin
      t.integer :waterend
      t.integer :internet
      t.integer :cleaner
      t.integer :parking
      t.integer :laundry
      t.integer :option1
      t.integer :option2
      t.integer :option3

      t.timestamps
    end
  end
end
