class AddBominusToBillings < ActiveRecord::Migration[5.2]
  def change
    add_column :billings, :bominus, :integer
  end
end
