class AddTotalToBillings < ActiveRecord::Migration[5.2]
  def change
    add_column :billings, :total, :integer
  end
end
