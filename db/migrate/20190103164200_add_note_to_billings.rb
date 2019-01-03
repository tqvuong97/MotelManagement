class AddNoteToBillings < ActiveRecord::Migration[5.2]
  def change
    add_column :billings, :note, :text
  end
end
