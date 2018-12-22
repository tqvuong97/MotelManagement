class CreateDevices < ActiveRecord::Migration[5.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :branch
      t.integer :quantity
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
