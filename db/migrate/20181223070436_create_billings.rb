class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.integer :electric
      t.integer :water
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
