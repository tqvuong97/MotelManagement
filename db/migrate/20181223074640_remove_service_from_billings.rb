class RemoveServiceFromBillings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :billings, :service, foreign_key: true
  end
end
