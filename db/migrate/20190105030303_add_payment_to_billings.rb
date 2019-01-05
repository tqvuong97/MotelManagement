class AddPaymentToBillings < ActiveRecord::Migration[5.2]
  def change
    add_column :billings, :payment, :boolean
  end
end
