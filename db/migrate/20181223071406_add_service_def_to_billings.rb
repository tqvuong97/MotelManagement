class AddServiceDefToBillings < ActiveRecord::Migration[5.2]
  def change
    add_reference :billings, :service, foreign_key: true
  end
end
