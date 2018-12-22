class RemoveQuantityAndStatusFromDevices < ActiveRecord::Migration[5.2]
  def change
    remove_column :devices, :quantity, :integer
    remove_column :devices, :status, :string
  end
end
