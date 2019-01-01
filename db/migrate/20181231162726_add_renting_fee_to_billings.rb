class AddRentingFeeToBillings < ActiveRecord::Migration[5.2]
  def change
    add_column :billings, :rentingfee, :integer
  end
end
